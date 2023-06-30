part of 'models.dart';

class TextureRuleModel {
  String id;
  String name;
  String ratio;
  String maxByteSize;
  String maxHeight;
  String defaultUrl;

  TextureRuleModel({
    this.id,
    this.name,
    this.ratio,
    this.maxByteSize,
    this.maxHeight,
    this.defaultUrl,
  });

  factory TextureRuleModel.fromJson(Map<String, dynamic> json) {
    TextureRuleModel data = TextureRuleModel(
      id: json['id'].toString(),
      name: json['name'],
      ratio: json['ratio'],
      maxByteSize: json['maxByteSize'].toString(),
      maxHeight: json['maxHeight'].toString(),
      defaultUrl: json['defaultUrl'],
    );

    return data;
  }
}
