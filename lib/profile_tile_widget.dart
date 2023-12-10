import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CustomTile extends StatefulWidget {
  const CustomTile(
      {this.imageUrl,
      this.description = '',
      this.title,
      this.amount,
      this.onTap,
      this.suffix,
      this.isSuffix = false,
      this.useName = true,
      this.useImage = true,
      this.useDescription = true,
      this.useOnlyDecscription = false,
      Key? key})
      : super(key: key);

  final String? imageUrl;
  final String description;
  final String? title;
  final int? amount;
  final Widget? suffix;
  final Function? onTap;
  final bool isSuffix;
  final bool useOnlyDecscription;
  final bool useName;
  final bool useImage;
  final bool useDescription;

  @override
  _CustomTileState createState() => _CustomTileState();
}

class _CustomTileState extends State<CustomTile> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    var image = widget.imageUrl == null
        ? const AssetImage('assets/demo_data/demo1.jpeg')
        : NetworkImage(widget.imageUrl!);
    var resAmount = "";
    if (widget.amount != null) {
      resAmount = widget.amount! > 999
          ? (widget.amount! / 1000).toString() + "K".toString()
          : widget.amount!.toString();
    }
    final Widget imageCont = Container(
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:
            DecorationImage(image: image as ImageProvider, fit: BoxFit.cover),
      ),
    );
    settingsItem({Widget? child}) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 6)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 6) // clip ripple
        .borderRadius(all: 6, animate: true)
        .elevation(
          pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(6),
          shadowColor: const Color(0x30000000),
        ) // shadow borderRadius
        .constrained(height: 80)
        .padding(vertical: 5) // margin
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          onTap: () => widget.onTap == null ? () {} : widget.onTap!(),
        )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(const Duration(milliseconds: 150), Curves.easeOut);

    final Widget imageContainer = imageCont.padding(all: 12).decorated(
          borderRadius: BorderRadius.circular(30),
        );

    final Widget title = Text(
      widget.title!,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ).padding(bottom: 5);
    final Widget description = Text(
      widget.useOnlyDecscription
          ? widget.description
          : widget.isSuffix
              ? widget.useName
                  ? resAmount + " " + widget.description + " " + widget.title!
                  : resAmount + " " + widget.description
              : widget.useName
                  ? widget.description + " " + widget.title! + " " + resAmount
                  : widget.description + " " + resAmount,
      style: const TextStyle(
        color: Colors.black26,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );

    return settingsItem(
      child: <Widget>[
        [
          if (widget.useImage) imageContainer,
          <Widget>[
            title,
            if (widget.useDescription) description,
          ].toColumn(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ].toRow(),
        if (widget.suffix != null) widget.suffix!,
      ]
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )
          .padding(
            right: 10,
          ),
    );
  }
}
