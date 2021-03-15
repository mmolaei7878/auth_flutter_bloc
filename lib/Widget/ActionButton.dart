import 'package:flutter/material.dart';
import 'package:auth_flutter_bloc/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButton extends StatelessWidget {
  final bool isSignUp;
  final GlobalKey<FormState> formkey;
  final Map<String, String> userData;
  ActionButton({
    this.isSignUp,
    this.formkey,
    this.userData,
  });
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return TextButton(
      onPressed: isSignUp
          ? () {
              if (!formkey.currentState.validate()) {
                return;
              }
              formkey.currentState.save();
              BlocProvider.of<AuthBloc>(context).add(
                AuthSignUpEvent(
                  email: userData['email'],
                  password: userData['password'],
                ),
              );
            }
          : () {
              formkey.currentState.save();
              BlocProvider.of<AuthBloc>(context).add(
                AuthLoginEvent(
                  email: userData['email'],
                  password: userData['password'],
                ),
              );
            },
      child: Text(isSignUp ? 'Sign Up' : 'Sign In'),
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Color(0xffFF7F56),
        minimumSize: Size(deviceSize.width / 2 + 65, 58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}
