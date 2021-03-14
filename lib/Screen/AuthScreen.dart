import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'lib/asset/sea2.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
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
            ),
            Positioned(
              bottom: 70,
              width: deviceSize.width,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      showSheet(context);
                    },
                    child: Text('Sign up'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xffFF7F56),
                      elevation: 5.0,
                      minimumSize: Size(deviceSize.width / 2 + 65, 58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    onPressed: () {
                      showSheet(context);
                    },
                    child: Text('Sign up'),
                    style: TextButton.styleFrom(
                      primary: Color(0xffFF7F56),
                      backgroundColor: Colors.white,
                      elevation: 5.0,
                      minimumSize: Size(deviceSize.width / 2 + 65, 58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(60),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Container(
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
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Account',
                        style: Theme.of(context).textTheme.bodyText1),
                    Text('upload  ')
                  ],
                ),
                alignment: Alignment.topLeft,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
