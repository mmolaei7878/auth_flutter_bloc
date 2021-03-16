import 'package:auth_flutter_bloc/bloc/CameraBloc/camera_bloc.dart';

import '../bloc/AuthBloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthSuccedScreen extends StatelessWidget {
  static const routeName = '/AuthSuccedScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CameraBloc, CameraState>(
            builder: (ctx, state) {
              if (state is CameraSuccedState) {
                return Image.file(state.image);
              } else
                return Container();
            },
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
              BlocProvider.of<CameraBloc>(context).add(DeleteSavedImage());
            },
            child: Text('Clear My Info'),
          ),
        ],
      ),
    );
  }
}
