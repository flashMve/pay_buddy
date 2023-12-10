import 'package:flutter/material.dart';

class UserStatItem extends StatelessWidget {
  const UserStatItem({Key? key, this.title = "Budget", this.value = 5000})
      : super(key: key);
  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    var val = value > 1000
        ? (value / 1000).toString() + "K"
        : value.toInt().toString();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            val,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            title.toString(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
