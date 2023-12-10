import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showBanner({
  required BuildContext context,
  String title = "Screen",
}) {
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      content: Text(title),
      actions: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: const Text("Dismiss"),
        )
      ],
    ),
  );
}

void showSnack({
  required BuildContext context,
  String title = "Screen",
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

void showModalSheet({
  GlobalKey<ScaffoldState>? scaffoldState,
  Widget? child,
  bool usePadding = false,
  bool enableDrag = true,
}) {
  var state = scaffoldState!;
  showModalBottomSheet(
    isDismissible: false,
    isScrollControlled: true,
    enableDrag: enableDrag,
    elevation: 10,
    context: state.currentContext!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (ctx) => usePadding
        ? Padding(
            padding: MediaQuery.of(ctx).viewInsets,
            child: child!
            // ??
            //     Container(
            //       height: size.height * percentage,
            //       width: size.width,
            //       decoration: const BoxDecoration(
            //         // color: Colors.blue,
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(10),
            //           topRight: Radius.circular(10),
            //         ),
            //       ),
            //       child: child,
            //     ),
            ,
          )
        : child!,
  );
}

setOverLay() {
  Future.delayed(const Duration(seconds: 1), () {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  });
}
