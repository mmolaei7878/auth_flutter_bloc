import 'package:flutter/material.dart';
import '../Widget/WidgetsFile.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/AuthScreen';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Stack(
          children: [
            BackgroundImage(),
            TopImage(),
            Buttons(),
          ],
        ),
      ),
    );
  }
}
