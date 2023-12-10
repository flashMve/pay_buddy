import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_buddy/Global/global_widget.dart';

class CustomAppBarRow extends StatelessWidget {
  const CustomAppBarRow({
    Key? key,
    this.onLeftTap,
    this.onRightTap,
    this.leftIcon = Icons.arrow_back_ios,
    this.rightIcon = FontAwesomeIcons.times,
  }) : super(key: key);
  final Function? onLeftTap;
  final Function? onRightTap;
  final IconData? leftIcon;
  final IconData? rightIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              if (onLeftTap != null) {
                onLeftTap!();
              }
              setOverLay();
            },
            icon: Icon(
              leftIcon,
            ),
          ),
          IconButton(
            onPressed: () {
              if (onRightTap != null) {
                setOverLay();
                onRightTap!();
              } else {
                setOverLay();
                Navigator.pop(context);
              }
            },
            icon: Icon(
              rightIcon,
            ),
          ),
        ],
      ),
    );
  }
}
