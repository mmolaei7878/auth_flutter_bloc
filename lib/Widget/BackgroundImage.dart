import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        'lib/asset/sea2.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
