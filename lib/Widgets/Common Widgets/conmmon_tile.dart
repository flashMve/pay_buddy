import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    this.title,
    this.description,
    this.imageUrl,
    this.suffix,
    this.amount,
    this.isSuffix = false,
    Key? key,
  }) : super(key: key);

  final String? title;
  final String? imageUrl;
  final String? description;
  final int? amount;
  final Widget? suffix;
  final bool isSuffix;

  @override
  Widget build(BuildContext context) {
    var image = imageUrl == null
        ? const AssetImage('assets/demo_data/demo1.jpeg')
        : NetworkImage(imageUrl!);

    final resAmount = amount! > 999
        ? (amount! / 1000).toString() + "K".toString()
        : amount!.toString();
    final Widget imageCont = Container(
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image:
            DecorationImage(image: image as ImageProvider, fit: BoxFit.cover),
      ),
    );
    final Widget tile = Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Material(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: const Color(0xffffffff),
        child: ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          leading: imageCont,
          title: Text(
            title.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            isSuffix ? "$resAmount $description" : "$description $resAmount",
            style: const TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          trailing: suffix,
        ),
      ),
    );

    return tile;
  }
}
