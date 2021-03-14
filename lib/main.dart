import 'package:auth_flutter_bloc/Screen/AuthSuccedScreen.dart';
import 'package:auth_flutter_bloc/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Screen/AuthScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => AuthBloc()..add(UnAuthEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          primarySwatch: Colors.orange,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (ctx, state) {
            if (state is AuthInitialState) {
              return AuthScreen();
            } else if (state is AuthSuccedState) {
              return AuthSuccedScreen();
            } else if (state is AuthLogoutEvent) {
              return AuthScreen();
            } else {
              return AuthScreen();
            }
          },
        ),
        routes: {
          AuthSuccedScreen.routeName: (ctx) => AuthSuccedScreen(),
          AuthScreen.routeName: (ctx) => AuthScreen(),
        },
      ),
    );
  }
}
