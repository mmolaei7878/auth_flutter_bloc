import 'package:flutter/material.dart';
import 'package:auth_flutter_bloc/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widget/WidgetsFile.dart';

class FormWidget extends StatelessWidget {
  final bool isSignUp;
  final GlobalKey<FormState> formkey;
  final Map<String, String> userData;
  FormWidget({
    this.isSignUp,
    this.formkey,
    this.userData,
  });
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            onSaved: (value) {
              userData['email'] = value;
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
              userData['password'] = value;
            },
            validator: (value) {
              if (value.length < 3) {
                return 'Too Short';
              }
              return null;
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
          BlocBuilder<AuthBloc, AuthState>(
            builder: (ctx, state) {
              if (state is AuthInitialState) {
                return ActionButton(
                  formkey: formkey,
                  isSignUp: isSignUp,
                  userData: userData,
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
                    minimumSize: Size(deviceSize.width / 2 + 65, 58),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                );
              } else {
                return ActionButton(
                  formkey: formkey,
                  isSignUp: isSignUp,
                  userData: userData,
                );
              }
            },
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
