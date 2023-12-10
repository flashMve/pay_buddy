import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_buddy/Global/colors.dart';
import 'package:pay_buddy/Global/variables.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/common_search_bar.dart';

import '../profile_tile_widget.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({
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
      length: 3,
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
                text: "Recieved",
              ),
              Tab(
                text: "Borrowed History",
              ),
              Tab(
                text: "Transaction History",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            firstChild(context, size!),
            firstChild(context, size!),
            firstChild(context, size!),
          ],
        ),
      ),
    );
  }

  Widget firstChild(BuildContext context, Size size) {
    return SingleChildScrollView(
      child: Container(
        height: size.height,
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
          isAppBar: false,
          listData: userData,
          child: (userData) {
            return CustomTile(
              title: userData['name'],
              amount: userData['amount'],
              description: "You Borrowed",
              useName: false,
              isSuffix: false,
              onTap: () {},
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
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1714333, size.height * 0.2480833);
    path_0.cubicTo(
        size.width * 0.6714333,
        size.height * 0.2480833,
        size.width * 0.5774333,
        size.height * 0.2475000,
        size.width * 0.8381000,
        size.height * 0.2480833);
    path_0.cubicTo(
        size.width * 0.8378667,
        size.height * 0.3730833,
        size.width * 0.8371000,
        size.height * 0.6230833,
        size.width * 0.8371000,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.8160000,
        size.height * 0.7234333,
        size.width * 0.8060000,
        size.height * 0.7494167,
        size.width * 0.8053667,
        size.height * 0.7482500);
    path_0.cubicTo(
        size.width * 0.7889000,
        size.height * 0.7264333,
        size.width * 0.7815000,
        size.height * 0.7409167,
        size.width * 0.7743667,
        size.height * 0.7484167);
    path_0.cubicTo(
        size.width * 0.7606333,
        size.height * 0.7255500,
        size.width * 0.7487333,
        size.height * 0.7424167,
        size.width * 0.7464333,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.7305000,
        size.height * 0.7256333,
        size.width * 0.7195333,
        size.height * 0.7418167,
        size.width * 0.7171000,
        size.height * 0.7482500);
    path_0.cubicTo(
        size.width * 0.7033000,
        size.height * 0.7255167,
        size.width * 0.6903333,
        size.height * 0.7424833,
        size.width * 0.6892000,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.6756333,
        size.height * 0.7249833,
        size.width * 0.6602333,
        size.height * 0.7437000,
        size.width * 0.6598000,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.6447333,
        size.height * 0.7256500,
        size.width * 0.6338667,
        size.height * 0.7439333,
        size.width * 0.6297667,
        size.height * 0.7477500);
    path_0.cubicTo(
        size.width * 0.6166333,
        size.height * 0.7261000,
        size.width * 0.6064667,
        size.height * 0.7436500,
        size.width * 0.6014333,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.5816333,
        size.height * 0.7259500,
        size.width * 0.5760333,
        size.height * 0.7430833,
        size.width * 0.5714333,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.5549667,
        size.height * 0.7261667,
        size.width * 0.5436000,
        size.height * 0.7435833,
        size.width * 0.5419000,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.5253000,
        size.height * 0.7268833,
        size.width * 0.5181333,
        size.height * 0.7433667,
        size.width * 0.5133333,
        size.height * 0.7481000);
    path_0.cubicTo(
        size.width * 0.4977333,
        size.height * 0.7268667,
        size.width * 0.4843000,
        size.height * 0.7438167,
        size.width * 0.4847667,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.4654667,
        size.height * 0.7271667,
        size.width * 0.4569000,
        size.height * 0.7440333,
        size.width * 0.4533333,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.4338667,
        size.height * 0.7285833,
        size.width * 0.4268667,
        size.height * 0.7442667,
        size.width * 0.4238000,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.4052333,
        size.height * 0.7283333,
        size.width * 0.3961000,
        size.height * 0.7442667,
        size.width * 0.3938000,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.3739000,
        size.height * 0.7278333,
        size.width * 0.3656333,
        size.height * 0.7444333,
        size.width * 0.3619000,
        size.height * 0.7483167);
    path_0.cubicTo(
        size.width * 0.3439667,
        size.height * 0.7289500,
        size.width * 0.3354000,
        size.height * 0.7446500,
        size.width * 0.3309667,
        size.height * 0.7478500);
    path_0.cubicTo(
        size.width * 0.3096667,
        size.height * 0.7288833,
        size.width * 0.3013667,
        size.height * 0.7449167,
        size.width * 0.2985000,
        size.height * 0.7480833);
    path_0.cubicTo(
        size.width * 0.2772667,
        size.height * 0.7293167,
        size.width * 0.2683000,
        size.height * 0.7431500,
        size.width * 0.2652333,
        size.height * 0.7478500);
    path_0.cubicTo(
        size.width * 0.2455333,
        size.height * 0.7297500,
        size.width * 0.2396333,
        size.height * 0.7439167,
        size.width * 0.2342333,
        size.height * 0.7473667);
    path_0.cubicTo(
        size.width * 0.2118333,
        size.height * 0.7299333,
        size.width * 0.2024333,
        size.height * 0.7440000,
        size.width * 0.1981000,
        size.height * 0.7480833);
    path_0.quadraticBezierTo(size.width * 0.1866000, size.height * 0.7369167,
        size.width * 0.1702333, size.height * 0.7413000);
    path_0.quadraticBezierTo(size.width * 0.1705333, size.height * 0.6180000,
        size.width * 0.1714333, size.height * 0.2480833);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
