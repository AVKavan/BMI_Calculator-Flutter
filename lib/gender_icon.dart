import 'package:flutter/material.dart';

class GenderIcon extends StatelessWidget {
  final IconData gicon;
  final String gtext;

  GenderIcon(this.gicon, this.gtext);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          gicon,
          size: 100,
        ),
        Text(gtext,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white54,
            )),
      ],
    );
  }
}
