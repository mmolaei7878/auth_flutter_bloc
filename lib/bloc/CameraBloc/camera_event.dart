part of 'camera_bloc.dart';

@immutable
abstract class CameraEvent {}

class OpenCameraEvent extends CameraEvent {
  final ImageSource imageSource;
  OpenCameraEvent(this.imageSource);
}

class GetSavedImage extends CameraEvent {}

class DeleteSavedImage extends CameraEvent {}
