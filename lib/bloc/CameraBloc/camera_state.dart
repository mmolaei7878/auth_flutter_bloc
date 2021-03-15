part of 'camera_bloc.dart';

@immutable
abstract class CameraState {}

class CameraInitial extends CameraState {}

class CameraInProgress extends CameraState {}

class CameraSuccedState extends CameraState {
  final File image;
  CameraSuccedState({this.image});
}
