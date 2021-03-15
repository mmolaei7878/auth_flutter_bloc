import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final String apiKey = 'AIzaSyDexn10OnJSWT1ZRLDHZKeKqoqX8xN1HXY';

  Future<String> signUp(String email, String password) async {
    print('signUp From Repo');
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    final prefs = await SharedPreferences.getInstance();

    final token = jsonDecode(response.body)['idToken'];
    final userData = jsonEncode(
      {'token': token},
    );
    prefs.setString('userData', userData);
    print(jsonDecode(response.body));
    return jsonDecode(response.body)['idToken'];
  }

  Future<String> login(String email, String password) async {
    print('sign In From Repo');
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    final token = jsonDecode(response.body)['idToken'];
    final prefs = await SharedPreferences.getInstance();
    final userData = jsonEncode(
      {'token': token},
    );
    prefs.setString('userData', userData);
    print(jsonDecode(response.body));
    return jsonDecode(response.body)['idToken'];
  }

  Future<String> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return null;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    print(extractedUserData);
    return extractedUserData['token'];
  }

  Future logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print('shared clear');
  }
}
