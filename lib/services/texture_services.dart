part of 'services.dart';

class TextureServices {
  static Future<List<TextureRuleModel>> getTextureRules(
      {http.Client client, String token}) async {
    String url = baseUrl + "/api/texture/rule";

    client ??= http.Client();

    var response = await client.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (response.statusCode != 200) {
      return null;
    }

    List data = json.decode(response.body);

    return data.map((e) => TextureRuleModel.fromJson(e)).toList();
  }

  static Future<dynamic> updateTexture(
      {String keyword, Uint8List image}) async {
    String url = baseUrl + "/api/texture";
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var request = http.MultipartRequest("POST", Uri.parse(url));

    request.headers.addAll({
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    });

    if (keyword == "banner_1")
      request.files.add(await http.MultipartFile.fromBytes('banner_1', image,
          filename: 'banner_1.jpg'));

    if (keyword == "banner_2")
      request.files.add(await http.MultipartFile.fromBytes('banner_2', image,
          filename: 'banner_2.jpg'));

    if (keyword == "poster_1")
      request.files.add(await http.MultipartFile.fromBytes('poster_1', image,
          filename: 'poster_1.jpg'));

    if (keyword == "poster_2")
      request.files.add(await http.MultipartFile.fromBytes('poster_2', image,
          filename: 'poster_2.jpg'));

    if (keyword == "thumbnail_1")
      request.files.add(await http.MultipartFile.fromBytes(
          'thumbnail_1', image,
          filename: 'thumbnail_1.jpg'));

    if (keyword == "logo_1")
      request.files.add(await http.MultipartFile.fromBytes('logo_1', image,
          filename: 'logo_1.jpg'));

    if (keyword == "logo_header_1")
      request.files.add(await http.MultipartFile.fromBytes(
          'header_logo_1', image,
          filename: 'header_logo_1.jpg'));

    var response = await request.send();

    return response;
  }
}
