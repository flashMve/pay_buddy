import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:pay_buddy/Global/variables.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/commen_text_field.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/common_search_bar.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/custom_app_bar_row.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/custom_bottom_sheet.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/custom_button.dart';
import 'package:pay_buddy/profile_tile_widget.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({
    Key? key,
    required this.size,
    this.percentage = 0.7,
    this.secondPercentage = 0.2,
  }) : super(key: key);
  final Size? size;
  final double? percentage;
  final double? secondPercentage;

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  bool showSecond = false;
  bool isDisabled = false;
  bool showAnimation = false;
  String onError = "";
  final TextEditingController cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      showSecond: showSecond,
      first: firstChild(context),
      second: secondChild(context),
    );
  }

  Widget firstChild(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints.expand(
          height: widget.size!.height * widget.percentage!,
        ),
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: CommonSearchBar(
          listData: userData,
          child: (userData) {
            return CustomTile(
              title: userData['name'],
              amount: userData['amount'],
              description: "Send Money to ${userData['name']}",
              isSuffix: true,
              useDescription: true,
              useOnlyDecscription: true,
              onTap: () {
                setState(() {
                  showSecond = !showSecond;
                });
              },
            );
          },
          notFound: const Center(
            child: Text(
              "Nothing Found",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget secondChild(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints.expand(
          height: widget.size!.height * widget.secondPercentage!,
        ),
        padding: const EdgeInsets.only(
          right: 5,
          left: 5,
          // top: 20,
          bottom: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBarRow(
              onLeftTap: showAnimation
                  ? () {}
                  : () {
                      setState(
                        () {
                          showSecond = !showSecond;
                          isDisabled = !isDisabled;
                        },
                      );
                    },
            ),
            if (showAnimation)
              const SizedBox(
                height: 80,
                width: 140,
                child: FlareActor(
                  "assets/check.flr",
                  fit: BoxFit.cover,
                  animation: "start",
                  alignment: Alignment.center,
                ),
              ),
            if (!showAnimation)
              CustomTextField(
                hintText: "Enter Amount",
                keyboardType: TextInputType.number,
                cont: cont,
                isDisabled: isDisabled,
                onTapped: () {},
                onError: onError,
                validator: (val) {
                  if (cont.text.isEmpty) {
                    onError = "This Field cannot be Empty";
                  } else {
                    onError = "";
                  }
                  setState(() {});
                },
              ),
            const Spacer(),
            CustomButton(
              text: showAnimation ? "Done" : "Send Money",
              height: showAnimation ? 40 : 60,
              width: double.maxFinite,
              onTap: showAnimation
                  ? () {
                      Navigator.of(context).pop();
                    }
                  : () {
                      if (cont.text.isNotEmpty) {
                        setState(() {
                          isDisabled = !isDisabled;
                        });
                        Future.delayed(const Duration(milliseconds: 500), () {
                          if (cont.text.isNotEmpty) {
                            assert(double.parse(cont.text) > 0);
                            setState(() {
                              showAnimation = !showAnimation;
                              isDisabled = !isDisabled;
                            });
                          }
                        });
                      } else {
                        validate();
                      }
                    },
              isDisabled: isDisabled,
            ),
          ],
        ),
      ),
    );
  }

  void validate() {
    if (cont.text.isEmpty) {
      onError = "This Field cannot be Empty";
    } else {
      onError = "";
    }
    setState(() {});
  }
}
