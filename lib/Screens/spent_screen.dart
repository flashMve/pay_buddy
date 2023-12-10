import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:pay_buddy/Global/colors.dart';
import 'package:pay_buddy/Global/variables.dart';
import 'package:pay_buddy/Widgets/Spent%20Screen/add_screen_widget.dart';
import 'package:pay_buddy/Widgets/Spent%20Screen/spen_history.dart';
import 'package:pay_buddy/profile_tile_widget.dart';

class SpentScreen extends StatelessWidget {
  const SpentScreen({
    Key? key,
    required this.size,
    this.percentage = 0.7,
    this.secondPercentage = 0.2,
  }) : super(key: key);
  final Size? size;
  final double? percentage;
  final double? secondPercentage;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          bottom: const TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1,
            indicatorColor: Colors.white,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Colors.white,
                ),
              ),
            ),
            tabs: [
              Tab(
                text: "Add Daily Spent",
              ),
              Tab(
                text: "Spent History",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AddDailySpent(
              size: size!,
            ),
            const SpentHistory(),
          ],
        ),
      ),
    );
  }
}
