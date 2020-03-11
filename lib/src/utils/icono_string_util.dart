import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'logout': Icons.backspace,
};

Icon getIcon(String iconName, iconColor) {
  if (iconName == 'logout') {
    iconColor = Colors.white;
  }

  return Icon(_icons[iconName], color: iconColor);
}
