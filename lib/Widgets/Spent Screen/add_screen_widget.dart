import 'package:flutter/material.dart';
import 'package:pay_buddy/Global/global_widget.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/commen_text_field.dart';
import 'package:pay_buddy/Widgets/Common%20Widgets/custom_button.dart';

class AddDailySpent extends StatefulWidget {
  const AddDailySpent({Key? key, this.size}) : super(key: key);
  final Size? size;

  @override
  State<AddDailySpent> createState() => _AddDailySpentState();
}

class _AddDailySpentState extends State<AddDailySpent> {
  Map<int, Map<String, dynamic>> textFieldData = {};

  Map<int, Widget> add() {
    Map<int, Widget> list = {};
    for (int i = 0; i < textFieldData.length; i++) {
      list.putIfAbsent(
        textFieldData.keys.toList()[i],
        () => rowTextField(
          remove: removeButton(
            isAdd: i == textFieldData.length - 1,
            index: textFieldData.keys.toList()[i],
          ),
          index: textFieldData.keys.toList()[i],
        ),
      );
    }
    return list;
  }

  List<Widget> addWidget() {
    List<Widget> list = [];
    list = add().values.toList().reversed.toList();
    // for (int i = 0; i < textFieldData.length; i++) {
    //   list.add(
    //     rowTextField(
    //       remove: removeButton(
    //         isAdd: i == textFieldData.length - 1,
    //         index: textFieldData.keys.toList()[i],
    //       ),
    //       index: textFieldData.keys.toList()[i],
    //     ),
    //   );
    // }
    return list;
  }

  Widget removeButton({bool? isAdd, int? index}) {
    return CustomButton(
      width: widget.size!.width * 0.12,
      text: isAdd! ? "+" : "-",
      height: 40,
      fontSize: 25,
      elevation: 1,
      onTap: () {
        if (isAdd) {
          textFieldData.putIfAbsent(
            index! + 1,
            () => {
              "title": "",
              "amount": 0,
              "cont1": TextEditingController(),
              "cont2": TextEditingController(),
              "titleError": "",
              "amountError": "",
              "titleDisable": false,
              "amountDisable": false,
            },
          );
        } else {
          textFieldData[index]!['cont1'].clear();
          textFieldData[index]!['cont2'].clear();
          textFieldData.removeWhere((key, value) => key == index);
        }
        setState(() {});
      },
    );
  }

  void saveInfo() {
    textFieldData.forEach((key, value) {
      if (textFieldData[key]!['cont1'].text.isEmpty ||
          textFieldData[key]!['cont2'].text.isEmpty) {
        String val = textFieldData[key]!['cont1'].text.isEmpty ? "Title" : "";
        String val1 = textFieldData[key]!['cont2'].text.isEmpty ? "Amount" : "";
        showSnack(
            context: context,
            title:
                "Please Enter Value for ${val.isEmpty ? val1 : val} on Field no. ${key + 1}");

        return;
      }
      print("INDEX => $key");
      print(value['title']);
      print(value['amount']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return textFieldData.isEmpty
        ? Container(
            alignment: Alignment.center,
            child: CustomButton(
              width: widget.size!.width * 0.5,
              text: "Add Daily Spent Money",
              height: 50,
              fontSize: 14,
              elevation: 1,
              onTap: () {
                textFieldData.putIfAbsent(
                    0,
                    () => {
                          "title": "",
                          "amount": 0,
                          "cont1": TextEditingController(),
                          "cont2": TextEditingController(),
                          "titleError": "",
                          "amountError": "",
                          "titleDisable": false,
                          "amountDisable": false,
                        });
                setState(() {});
              },
            ),
          )
        : Container(
            margin: const EdgeInsets.only(top: 8),
            height: widget.size!.height,
            width: widget.size!.width,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => addWidget()[index],
                    itemCount: textFieldData.length,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  alignment: Alignment.center,
                  child: CustomButton(
                    width: widget.size!.width * 0.3,
                    text: "Save Data",
                    height: 50,
                    fontSize: 14,
                    elevation: 1,
                    onTap: () {
                      saveInfo();
                    },
                  ),
                )
              ],
            ),
          );
  }

  Widget rowTextField({
    Widget? remove,
    int? index,
  }) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 1),
          width: widget.size!.width * 0.43,
          child: CustomTextField(
            hintText: "Title",
            cont: textFieldData[index!]!['cont1'],
            isDisabled: textFieldData[index]!['titleDisable'],
            onTapped: () {},
            onChange: (val) {
              textFieldData[index]!['title'] = val;
              textFieldData[index]!['titleDisable'] = true;
            },
            onError: textFieldData[index]!['titleError'],
            validator: (val) {
              if (val.isEmpty) {
                textFieldData[index]!['titleError'] = "Title ?";
              } else {
                textFieldData[index]!['titleError'] = "";
              }
              setState(() {});
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 1),
          width: widget.size!.width * 0.43,
          child: CustomTextField(
            hintText: "Amount",
            keyboardType: TextInputType.number,
            cont: textFieldData[index]!['cont2'],
            isDisabled: textFieldData[index]!['amountDisable'],
            onChange: (val) {
              textFieldData[index]!['amount'] = val;
              textFieldData[index]!['amountDisable'] = true;
            },
            onError: textFieldData[index]!['amountError'],
            onTapped: () {},
            validator: (val) {
              if (val.isEmpty) {
                textFieldData[index]!['amountError'] = "Amount ?";
              } else {
                textFieldData[index]!['amountError'] = "";
              }
              setState(() {});
            },
          ),
        ),
        remove!,
      ],
    );
  }
}
