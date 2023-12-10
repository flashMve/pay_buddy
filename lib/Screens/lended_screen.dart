import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:pay_buddy/Global/colors.dart';
import 'package:pay_buddy/Global/global_widget.dart';
import 'package:pay_buddy/Global/variables.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/common_search_bar.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/custom_app_bar_row.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/custom_bottom_sheet.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/custom_button.dart';
import 'package:pay_buddy/profile_tile_widget.dart';

class LendedScreen extends StatefulWidget {
  const LendedScreen({
    Key? key,
    required this.size,
    this.percentage = 0.7,
    this.secondPercentage = 0.2,
  }) : super(key: key);
  final Size? size;
  final double? percentage;
  final double? secondPercentage;

  @override
  State<LendedScreen> createState() => _LendedScreenState();
}

class _LendedScreenState extends State<LendedScreen> {
  bool showSecond = false;
  bool isDisabled = false;
  bool showAnimation = false;

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
            var res = userData['amount'] > 999
                ? (userData['amount'] / 1000).toString() + "K"
                : userData['amount'];
            return CustomTile(
              title: userData['name'],
              amount: userData['amount'],
              description: "You Lended",
              isSuffix: false,
              onTap: () {
                setState(() {
                  showSecond = !showSecond;
                });
                showSnack(
                  context: context,
                  title: "${userData['name']} Borrowed $res from you",
                );
              },
              suffix: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Ask Back $res",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
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
                      setState(() {
                        showSecond = !showSecond;
                      });
                    },
            ),
            showAnimation
                ? const SizedBox(
                    height: 80,
                    width: 140,
                    child: FlareActor(
                      "assets/check.flr",
                      fit: BoxFit.cover,
                      animation: "start",
                      alignment: Alignment.center,
                    ),
                  )
                : const Center(
                    child: Text(
                      "Are you sure ?",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            const Spacer(),
            CustomButton(
              width: double.maxFinite,
              height: showAnimation ? 40 : 60,
              text: showAnimation ? "Done" : "Confirm Send",
              onTap: showAnimation
                  ? () {
                      Navigator.pop(context);
                    }
                  : () {
                      setState(() {
                        isDisabled = !isDisabled;
                      });
                      Future.delayed(
                        const Duration(seconds: 2),
                        () {
                          setState(
                            () {
                              showAnimation = !showAnimation;
                              isDisabled = !isDisabled;
                            },
                          );
                        },
                      );
                    },
              isDisabled: isDisabled,
            ),
          ],
        ),
      ),
    );
  }
}
