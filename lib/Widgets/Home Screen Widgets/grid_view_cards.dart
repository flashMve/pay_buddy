import 'package:flutter/material.dart';
import 'package:pay_buddy/Models/settings_model.dart';
import 'package:pay_buddy/Widgets/Home%20Screen%20Widgets/settings_item.dart';

class GridViewCards extends StatelessWidget {
  const GridViewCards({
    Key? key,
    required this.settingsItems,
  }) : super(key: key);

  final List<SettingsItemModel> settingsItems;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // color: Colors.blue,
        margin: const EdgeInsets.only(
          top: 10,
          right: 5,
          left: 5,
          bottom: 5,
        ),
        child: GridView(
          // physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // mainAxisSpacing: 5,
            crossAxisSpacing: 15,
          ),
          children: settingsItems
              .map(
                (settingsmodel) => SettingsItem(
                  icon: settingsmodel.icon,
                  description: settingsmodel.description,
                  iconBgColor: settingsmodel.color,
                  title: settingsmodel.title,
                  onTap: settingsmodel.onTap,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
