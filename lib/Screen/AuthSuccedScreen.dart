import 'package:auth_flutter_bloc/bloc/CameraBloc/camera_bloc.dart';

import '../bloc/AuthBloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthSuccedScreen extends StatelessWidget {
  static const routeName = '/AuthSuccedScreen';
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CameraBloc, CameraState>(
              builder: (ctx, state) {
                if (state is CameraSuccedState) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.file(
                      state.image,
                      fit: BoxFit.cover,
                      width: 250,
                      height: 250,
                    ),
                  );
                } else
                  return Container();
              },
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
                BlocProvider.of<CameraBloc>(context).add(DeleteSavedImage());
              },
              child: Text('Clear My Info'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color(0xffFF7F56),
                minimumSize: Size(deviceSize.width / 2 + 65, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
