import 'dart:async';
import 'dart:io';
import 'package:auth_flutter_bloc/bloc/AuthBloc/auth_bloc.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraInitial());
  File image;
  final imagePicker = ImagePicker();
  Future<File> getCameraImage(ImageSource source) async {
    final pickedImage = await imagePicker.getImage(
      source: source,
      maxWidth: 600,
      maxHeight: 600,
    );
    if (pickedImage != null) {
      return image = File(pickedImage.path);
    }
  }

  saveImage(File imageFile) async {
    if (imageFile != null) {
      final appDir = await syspath.getApplicationDocumentsDirectory();
      final filename = path.basename(imageFile.path);
      final savedImage = await imageFile.copy(appDir.path + filename);
      final perfs = await SharedPreferences.getInstance();
      perfs.setString('userImage', savedImage.path);
    }
  }

  Future<File> getSharedImage() async {
    final perfs = await SharedPreferences.getInstance();
    final imageFile = perfs.getString('userImage');
    if (imageFile != null) {
      return File(imageFile);
    }
  }

  @override
  Stream<CameraState> mapEventToState(
    CameraEvent event,
  ) async* {
    if (event is OpenCameraEvent) {
      yield CameraInProgress();
      final image = await getCameraImage(event.imageSource);
      yield CameraSuccedState(image: image);
      await saveImage(image);
    } else if (event is GetSavedImage) {
      yield CameraInProgress();
      final image = await getSharedImage();
      if (image != null) {
        yield CameraSuccedState(image: image);
      } else {
        yield CameraInitial();
      }
    } else if (event is DeleteSavedImage) {
      yield CameraInitial();
    }
  }
}
