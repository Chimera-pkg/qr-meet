part of 'services.dart';

class AuthServices {
  static Future<http.Response> login(
      {String email, String password, String eventID}) async {
    String url = baseUrl + "/api/login";

    return http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'email': email ?? "",
        'password': password ?? "",
        'event_id': eventID ?? "",
      }),
    );
  }
}
