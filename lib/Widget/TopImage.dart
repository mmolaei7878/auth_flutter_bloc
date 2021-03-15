import 'package:flutter/material.dart';

class TopImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Icon(
              Icons.image,
              size: 50,
              color: Color(0xffFF7F56),
            ),
            width: 55,
            height: 55,
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            'Enjoy the trip',
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'with me',
            style: TextStyle(color: Colors.white, fontSize: 35),
          )
        ],
      ),
    );
  }
}
