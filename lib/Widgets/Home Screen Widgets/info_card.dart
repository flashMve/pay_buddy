import 'package:flutter/material.dart';
import 'package:pay_buddy/Widgets/Home%20Screen%20Widgets/profile_screen_info.dart';
import 'package:pay_buddy/Widgets/Home%20Screen%20Widgets/user_stat_item.dart';

import '../../Global/colors.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        // top: 60,
        left: 10,
        right: 10,
        bottom: 5,
      ),
      child: Material(
        elevation: 10,
        shadowColor: secondaryColor,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 200,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: primaryColor,
            boxShadow: const [
              BoxShadow(
                color: secondaryColor,
                blurRadius: 0.5,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileInfoRow(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    UserStatItem(title: "Budget", value: 5000),
                    UserStatItem(title: "Lended", value: 400),
                    UserStatItem(title: "Borrowed", value: 500),
                    UserStatItem(title: "Spended", value: 2300),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
