import 'package:flutter/material.dart';

class NormalAppIcon extends StatelessWidget {
  const NormalAppIcon({Key? key}) : super(key: key);

  static double size = 68;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: FractionallySizedBox(
        heightFactor: 0.68,
        widthFactor: 0.68,
        child: Image.asset(
          'images/ic_launcher.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
