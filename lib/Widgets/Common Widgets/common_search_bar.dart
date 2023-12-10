import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/commen_text_field.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/search_result_container.dart';

class CommonSearchBar extends StatefulWidget {
  const CommonSearchBar(
      {Key? key,
      this.child,
      this.listData,
      this.notFound,
      this.isAppBar = true})
      : super(key: key);
  final Widget Function(Map<String, dynamic>)? child;
  final List<Map<String, dynamic>>? listData;
  final Widget? notFound;
  final bool isAppBar;

  @override
  State<CommonSearchBar> createState() => _CommonSearchBarState();
}

class _CommonSearchBarState extends State<CommonSearchBar> {
  final TextEditingController? cont = TextEditingController();
  String query = "";

  @override
  Widget build(BuildContext context) {
    var result = query.isEmpty
        ? widget.listData
        : widget.listData!
            .where(
              (data) => data['name'].toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 30,
            top: 20,
          ),
          alignment: Alignment.bottomRight,
          padding: const EdgeInsets.only(
            right: 5,
          ),
          width: double.maxFinite,
          child: widget.isAppBar
              ? InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    FontAwesomeIcons.times,
                  ),
                )
              : Container(),
        ),
        CustomTextField(
          cont: cont,
          onChange: (val) {
            query = val;
            setState(() {});
          },
        ),
        Expanded(
          child: SearchResultContainer(
            userData: result,
            child: widget.child,
            notFound: widget.notFound,
          ),
        )
      ],
    );
  }
}
