import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:pay_buddy/Global/variables.dart';
import 'package:pay_buddy/profile_tile_widget.dart';

class SpentHistory extends StatefulWidget {
  const SpentHistory({
    Key? key,
  }) : super(key: key);

  @override
  State<SpentHistory> createState() => _SpentHistoryState();
}

class _SpentHistoryState extends State<SpentHistory> {
  DateTime? selectedDate;

  @override
  void initState() {
    setState(() {
      selectedDate = DateTime.now();
    });
    super.initState();
  }

  final _controller = AdvancedCalendarController.custom(DateTime.now());
// ...

  @override
  Widget build(BuildContext context) {
    var date;
    date = _controller.value.year.toString() +
        "-" +
        _controller.value.month.toString() +
        "-" +
        _controller.value.day.toString();
    _controller.addListener(() {
      date = _controller.value.year.toString() +
          "-" +
          _controller.value.month.toString() +
          "-" +
          _controller.value.day.toString();
      setState(() {});
    });
    return Scaffold(
      body: Column(
        children: [
          AdvancedCalendar(
            controller: _controller,
            weekLineHeight: 48.0,
            // weeksInMonthViewAmount: 10,
          ),
          Expanded(
            child: spentHistory![date] == null
                ? const Center(
                    child: Text("Nothin Found"),
                  )
                : ListView.builder(
                    itemCount: spentHistory![date]!.length,
                    itemBuilder: (ctx, index) => CustomTile(
                      title: spentHistory![date]![index]["name"],
                      description: 'Hello From my side',
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
