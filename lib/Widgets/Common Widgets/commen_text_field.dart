import 'package:flutter/material.dart';
import 'package:pay_buddy/Global/colors.dart';
import 'package:pay_buddy/Global/global_widget.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.cont,
    this.onChange,
    this.hintText = 'Search Friends',
    this.fillColor = primaryColor,
    this.onTapped,
    this.isDisabled = false,
    this.onError = "",
    this.keyboardType = TextInputType.name,
    this.validator,
    this.opacity = 0.7,
  }) : super(key: key);
  final TextEditingController? cont;
  final String? hintText;
  final Color? fillColor;
  final double? opacity;
  final bool isDisabled;
  final String onError;
  final TextInputType? keyboardType;
  final Function? onTapped;
  final Function(String)? validator;
  final Function(String)? onChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: widget.onError.isEmpty ? 50 : 65,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              keyboardType: widget.keyboardType,
              controller: widget.cont,
              onTap: () {
                if (!isTapped) {
                  setState(() {
                    isTapped = !isTapped;
                  });
                }
              },
              onSubmitted: (val) {
                if (widget.onTapped != null) {
                  widget.onTapped!();
                }
                if (widget.validator != null) {
                  widget.validator!(val);
                }
                setOverLay();
                setState(() {
                  isTapped = !isTapped;
                });
              },
              onChanged: (val) {
                if (widget.onChange != null) {
                  widget.onChange!(val);
                }
              },
              style: TextStyle(
                color: isTapped ? Colors.white : Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
              cursorColor: isTapped ? Colors.black : Colors.blueGrey,
              enabled: !(widget.isDisabled),
              decoration: InputDecoration(
                fillColor: widget.fillColor!.withOpacity(widget.opacity!),
                filled: isTapped,
                hintText: widget.hintText,
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintStyle: TextStyle(
                  color: isTapped ? Colors.white : Colors.blueGrey,
                ),
              ),
            ),
            if (widget.onError.isNotEmpty)
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.onError,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 13,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
