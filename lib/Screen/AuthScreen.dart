import 'package:auth_flutter_bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = '/AuthScreen';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(UnAuthEvent());
  }

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
            ),
          ],
        ),
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
                      Text(isSignUp ? 'Account' : 'Name',
                          style: Theme.of(context).textTheme.bodyText1),
                      Text(isSignUp ? 'upload  ' : '')
                    ],
                  ),
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (value) {
                            _userData['email'] = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            icon: Icon(Icons.email),
                          ),
                        ),
                        if (isSignUp)
                          SizedBox(
                            height: 8,
                          ),
                        /*  if (isSignUp)
                          TextFormField(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              icon: Icon(Icons.person),
                            ),
                          ), */
                        if (isSignUp)
                          SizedBox(
                            height: 8,
                          ),
                        TextFormField(
                          onSaved: (value) {
                            _userData['password'] = value;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            icon: Icon(Icons.lock),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(builder: (ctx, state) {
                          if (state is AuthInitialState) {
                            return TextButton(
                              onPressed: isSignUp
                                  ? () {
                                      _formkey.currentState.save();
                                      BlocProvider.of<AuthBloc>(context).add(
                                        AuthSignUpEvent(
                                          email: _userData['email'],
                                          password: _userData['password'],
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                    }
                                  : () {
                                      _formkey.currentState.save();

                                      BlocProvider.of<AuthBloc>(context).add(
                                        AuthLoginEvent(
                                          email: _userData['email'],
                                          password: _userData['password'],
                                        ),
                                      );
                                      Navigator.of(context).pop();
                                    },
                              child: Text('Auth Initialized'),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Color(0xffFF7F56),
                                minimumSize:
                                    Size(deviceSize.width / 2 + 65, 58),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                            );
                          } else if (state is AuthInProgressState) {
                            return TextButton(
                              onPressed: () {},
                              child: Center(
                                child: CircularProgressIndicator(
                                    backgroundColor: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Color(0xffFF7F56),
                                minimumSize:
                                    Size(deviceSize.width / 2 + 65, 58),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                              ),
                            );
                          } else if (state is AuthSuccedState) {
                            return Center(
                              child: Text('Your Succed'),
                            );
                          } else if (state is AuthFailedState) {
                            return Center(
                              child: Text('Failed'),
                            );
                          } else {
                            return Center(
                              child: Text('Else Case'),
                            );
                          }
                        }),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
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
