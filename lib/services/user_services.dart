part of 'services.dart';

class UserServices {
  static Future<UserModel> getUser({http.Client client, String token}) async {
    String url = baseUrl + "/api/user";

    client ??= http.Client();

    var response = await client.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (response.statusCode != 200) {
      return null;
    }

    var data = json.decode(response.body);

    return UserModel.fromJson(data);
  }
}
