import 'package:flutter/material.dart';

class SettingsItemModel {
  final IconData icon;
  final Color color;
  final String title;
  final String description;
  final Function onTap;
  const SettingsItemModel({
    required this.color,
    required this.description,
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
