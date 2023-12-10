import 'package:flutter/material.dart';

class SearchResultContainer extends StatelessWidget {
  const SearchResultContainer(
      {Key? key, this.userData, this.child, this.notFound})
      : super(key: key);
  final List<Map<String, dynamic>>? userData;
  final Widget Function(Map<String, dynamic>)? child;
  final Widget? notFound;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 5, left: 5),
      child: userData!.isEmpty
          ? notFound
          : ListView.builder(
              itemBuilder: (ctx, index) => child!(userData![index]),
              itemCount: userData!.length,
            ),
    );
  }
}
