part of 'services.dart';

class ConfigUserServices {
  static Future<dynamic> getConfig(
      {http.Client client, column, keyword}) async {
    String url =
        baseUrl + "/api/user/config?column=" + column + "&keyword=" + keyword;

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

    if (response == null || json.decode(response.body).isEmpty) {
      return null;
    } else {
      return jsonDecode(json.decode(response.body)[0]["content_json"]);
    }
  }

  static Future<http.Response> setConfig(
      {Map<String, dynamic> contentJson, keyword}) async {
    String url = baseUrl + "/api/user/config";
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final data = {"name": keyword, "content_json": jsonEncode(contentJson)};

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
