import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_buddy/Global/global_widget.dart';
import 'package:pay_buddy/Models/settings_model.dart';
import 'package:pay_buddy/Screens/borrowed_screen.dart';
import 'package:pay_buddy/Screens/lended_screen.dart';
import 'package:pay_buddy/Screens/records_screen.dart';
import 'package:pay_buddy/Screens/savings_page.dart';
import 'package:pay_buddy/Screens/send_money_screen.dart';
import 'package:pay_buddy/Screens/spent_screen.dart';
import 'package:pay_buddy/Widgets/Home%20Screen%20Widgets/grid_view_cards.dart';
import 'package:pay_buddy/Widgets/Home%20Screen%20Widgets/info_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _state = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get getState => _state;
  late final List<SettingsItemModel> settingsItems;

  @override
  void initState() {
    super.initState();

    settingsItems = [
      SettingsItemModel(
        icon: FontAwesomeIcons.handshake,
        color: Colors.blue,
        title: "Lend",
        description: "Lended to Friend",
        onTap: () {
          showModalSheet(
            scaffoldState: getState,
            child: LendedScreen(
              size: MediaQuery.of(getState.currentContext!).size,
              percentage: 1,
              secondPercentage: 0.25,
            ),
          );
        },
      ),
      SettingsItemModel(
        icon: FontAwesomeIcons.handHoldingUsd,
        color: Colors.pink,
        title: "Borrowed",
        description: "Borrowed From Friends",
        onTap: () {
          showModalSheet(
            scaffoldState: getState,
            child: BorrowedScreen(
              size: MediaQuery.of(getState.currentContext!).size,
              percentage: 1,
              secondPercentage: 0.25,
            ),
          );
        },
      ),
      SettingsItemModel(
        icon: FontAwesomeIcons.fileInvoiceDollar,
        color: Colors.deepPurpleAccent,
        title: "Records",
        description: "Payment Records",
        onTap: () {
          showModalSheet(
            scaffoldState: getState,
            enableDrag: false,
            child: RecordsScreen(
              size: MediaQuery.of(getState.currentContext!).size,
              percentage: 1,
              secondPercentage: 0.25,
            ),
          );
        },
      ),
      SettingsItemModel(
        icon: FontAwesomeIcons.cloudUploadAlt,
        color: Colors.orange,
        title: "Send",
        description: "Send Money to Friends",
        onTap: () {
          showModalSheet(
            scaffoldState: getState,
            usePadding: true,
            child: SendMoneyScreen(
              size: MediaQuery.of(getState.currentContext!).size,
              percentage: 1,
              secondPercentage: 0.25,
            ),
          );
        },
      ),
      SettingsItemModel(
        icon: FontAwesomeIcons.creditCard,
        color: Colors.blue,
        title: "Spent",
        description: "Add Daily Spent Money",
        onTap: () {
          showModalSheet(
            scaffoldState: getState,
            enableDrag: false,
            child: SpentScreen(
              size: MediaQuery.of(getState.currentContext!).size,
              percentage: 1,
              secondPercentage: 0.25,
            ),
          );
        },
      ),
      SettingsItemModel(
        icon: FontAwesomeIcons.piggyBank,
        color: Colors.green,
        title: "Savings",
        description: "All your Savings",
        onTap: () {
          showModalSheet(
            scaffoldState: getState,
            child: SavingsScreen(
              size: MediaQuery.of(getState.currentContext!).size,
              percentage: 1,
              secondPercentage: 0.25,
            ),
          );
        },
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _state,
      body: Column(
        children: [
          Container(
            height: size.height * 0.04,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              top: 5,
            ),
          ),
          const InfoCard(),
          GridViewCards(settingsItems: settingsItems),
        ],
      ),
    );
  }
}
