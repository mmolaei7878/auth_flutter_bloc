import 'package:auth_flutter_bloc/bloc/CameraBloc/camera_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: BlocBuilder<CameraBloc, CameraState>(
        builder: (ctx, state) {
          if (state is CameraInitial) {
            return IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () {
                BlocProvider.of<CameraBloc>(context).add(OpenCameraEvent());
              },
            );
          } else if (state is CameraInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CameraSuccedState) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<CameraBloc>(context).add(OpenCameraEvent());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: state.image == null
                    ? Image.asset(
                        'lib/asset/imageholder.png',
                        width: 45,
                        height: 45,
                      )
                    : Image.file(
                        state.image,
                        width: 65,
                        height: 65,
                        fit: BoxFit.cover,
                      ),
              ),
            );
          } else {
            return IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () {
                BlocProvider.of<CameraBloc>(context).add(OpenCameraEvent());
              },
            );
          }
        },
      ),
    );
  }
}
