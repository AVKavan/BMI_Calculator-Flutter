import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final void Function()? pressFunc;
  ReusableCard({required this.colour, this.cardChild, this.pressFunc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressFunc,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
