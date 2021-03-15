import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class CameraRepository {
  Future uploadImage({File file, String text}) async {
    final url = 'https://justaqucktest-default-rtdb.firebaseio.com/.json';
    final request = http.MultipartRequest(
      "POST",
      Uri.parse(url),
    );
    request.fields['text_field'] = text;
    final pic = await http.MultipartFile.fromPath('file_field', file.path);
    request.files.add(pic);
    final response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }

  Future getImage() async {
    final url = 'https://justaqucktest-default-rtdb.firebaseio.com/.json';
    final response = await http.get(Uri.parse(url));
    print(jsonDecode(response.body));
  }
}
