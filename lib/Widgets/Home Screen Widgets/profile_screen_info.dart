import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pay_buddy/Global/global_widget.dart';

class ProfileInfoRow extends StatelessWidget {
  ProfileInfoRow({
    Key? key,
    this.name = "Your Name",
    this.designation = "Your Designation",
    this.image = "",
  }) : super(key: key);
  final String name;
  final String designation;
  final String image;
  final colorizeColors = [
    Colors.black,
    Colors.grey,
    Colors.grey.shade600,
    Colors.grey.shade300,
  ];
  final colorizeTextStyle = const TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    var img = image.isEmpty
        ? const AssetImage("assets/demo_data/demo1.jpeg")
        : NetworkImage(image);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                showBanner(context: context, title: "Profile");
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: img as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.only(right: 10.0),
                margin: const EdgeInsets.only(right: 10.0),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    designation,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        AnimatedTextKit(
          isRepeatingAnimation: true,
          repeatForever: true,
          animatedTexts: [
            ColorizeAnimatedText(
              'PAY BUDDY',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
        ),
      ],
    );
  }
}
