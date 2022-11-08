import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  RoundIconButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        size: 40,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Colors.white38,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
