part of 'models.dart';

class ConfigModel {
  String id;
  String name;
  String contentJson;
  String createdAt;
  String updatedAt;

  ConfigModel({
    this.id,
    this.name,
    this.contentJson,
    this.createdAt,
    this.updatedAt,
  });

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    ConfigModel data = ConfigModel(
      id: json['id'].toString(),
      name: json['name'],
      contentJson: json['content_json'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

    return data;
  }
}
