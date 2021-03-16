part of 'camera_bloc.dart';

@immutable
abstract class CameraEvent {}

class OpenCameraEvent extends CameraEvent {}

class GetSavedImage extends CameraEvent {}

class DeleteSavedImage extends CameraEvent {}
