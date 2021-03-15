import 'dart:async';
import 'dart:io';

import 'package:auth_flutter_bloc/Repository/CameraRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraInitial());
  final _repository = CameraRepository();
  File image;
  final imagePicker = ImagePicker();
  Future<File> getCameraImage() async {
    final pickedImage = await imagePicker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
      maxHeight: 600,
    );
    return image = File(pickedImage.path);
  }

  @override
  Stream<CameraState> mapEventToState(
    CameraEvent event,
  ) async* {
    if (event is OpenCameraEvent) {
      yield CameraInProgress();
      final image = await getCameraImage();
      yield CameraSuccedState(image: image);
    } else if (event is StartUploadImageEvent) {
      yield CameraInProgress();
      await _repository.uploadImage(file: image, text: 'newPic');
      yield CameraSuccedState();
    }
  }
}
