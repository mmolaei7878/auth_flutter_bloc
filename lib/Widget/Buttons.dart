import 'package:flutter/material.dart';
import '../Widget/WidgetsFile.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: 70,
      width: deviceSize.width,
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              showSheet(context: context, isSignUp: true);
            },
            child: Text('Sign up'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Color(0xffFF7F56),
              elevation: 5.0,
              minimumSize: Size(deviceSize.width / 2 + 65, 65),
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
              showSheet(context: context, isSignUp: false);
            },
            child: Text('Sign in'),
            style: TextButton.styleFrom(
              primary: Color(0xffFF7F56),
              backgroundColor: Colors.white,
              elevation: 5.0,
              minimumSize: Size(deviceSize.width / 2 + 65, 65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ],
      ),
    );
  }

  showSheet({BuildContext context, bool isSignUp}) {
    final deviceSize = MediaQuery.of(context).size;
    final _formkey = GlobalKey<FormState>();
    Map<String, String> _userData = {
      'email': '',
      'password': '',
    };
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
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isSignUp ? 'New' : 'WelcomeBack',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      CameraButton()
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(isSignUp ? 'Account' : 'Name',
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: FormWidget(
                    formkey: _formkey,
                    isSignUp: isSignUp,
                    userData: _userData,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
