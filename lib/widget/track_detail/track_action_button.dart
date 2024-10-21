import 'package:flutter/material.dart';

import '../../const/style.dart';

class TrackActionButton extends StatelessWidget {
  TrackActionButton(
      {super.key,
      required this.icon,
      required this.isEnabled,
      required this.onPressed});

  bool isEnabled;
  IconData icon;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: iconButtonSize,
        color: isEnabled ? Colors.black : Colors.black12,
        onPressed: isEnabled ? onPressed : null,
        icon: Icon(
          icon,
        ));
  }
}
