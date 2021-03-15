import 'package:flutter/material.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.fromBorderSide(
          BorderSide(
            width: 2,
            color: Color(0xffFF7F56),
          ),
        ),
      ),
      child: IconButton(
        iconSize: 30.0,
        icon: Icon(Icons.camera_alt_outlined),
        onPressed: () {},
      ),
    );
  }
}
