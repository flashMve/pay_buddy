import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_buddy/Global/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.elevation = 10,
    this.text = "Send Money",
    this.radius = 10,
    this.width = 140,
    this.height = 60,
    this.fontSize = 16,
    this.onTap,
    this.isDisabled = false,
  }) : super(key: key);

  final String text;
  final double height;
  final double width;
  final double elevation;
  final double radius;
  final double fontSize;
  final Function? onTap;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shadowColor: secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: InkWell(
        onTap: isDisabled
            ? null
            : () {
                if (onTap != null) {
                  onTap!();
                }
              },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: isDisabled
              ? const Center(
                  child: CupertinoActivityIndicator(
                    animating: true,
                    radius: 15,
                  ),
                )
              : Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
