import 'package:auth_flutter_bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthSuccedScreen extends StatelessWidget {
  static const routeName = '/AuthSuccedScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
          },
          child: Text('Press To Log Out'),
        ),
      ),
    );
  }
}
