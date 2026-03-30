import 'package:flutter/material.dart';
import '../../domain/entities/settings_action_type.dart';

class SettingsItemModel {
  final String title;
  final String icon;
  final SettingsActionType action;
  final Color? iconColor;
  final double? iconSize;
  final Color? iconBackgroundColor;

  const SettingsItemModel({
    required this.title,
    required this.icon,
    required this.action,
    this.iconColor,
    this.iconSize,
    this.iconBackgroundColor,
  });
}
