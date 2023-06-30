part of 'services.dart';

class ConfigServices {
  static Future<List<dynamic>> getConfig(
      {http.Client client, String name}) async {
    String url = baseUrl +
        "/api/config?column=name&keyword=%25" +
        name +
        "%25&first=false&cache=false";

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    client ??= http.Client();

    var response = await client.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (response.statusCode != 200) {
      return null;
    }

    if (response == null) {
      return null;
    }

    return jsonDecode(response.body);
  }

  static Future<http.Response> setConfig(
      {String name, Map<String, dynamic> contentJson}) async {
    String url = baseUrl + "/api/config";
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final data = {'name': name, 'content_json': jsonEncode(contentJson)};

    return http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "Authorization": "Bearer $token",
      },
      body: jsonEncode(data),
    );
  }
}
