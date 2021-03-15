part of 'camera_bloc.dart';

@immutable
abstract class CameraEvent {}

class OpenCameraEvent extends CameraEvent {}

class StartUploadImageEvent extends CameraEvent {}

class GetUploadedImageEvent extends CameraEvent {}
