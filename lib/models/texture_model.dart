part of 'models.dart';

class TextureModel {
  String name;
  String email;
  String premiumLevel;
  String createdAt;
  String updatedAt;
  String atlas;
  List<BootTextureModel> boothTextures;

  TextureModel({
    this.name,
    this.email,
    this.premiumLevel,
    this.createdAt,
    this.updatedAt,
    this.atlas,
  });
}

class BootTextureModel {
  String id;
  String tenantId;
  String url;
  String position;
  String textureTypeId;
  String transparent;
  String createdAt;
  String updatedAt;

  BootTextureModel({
    this.id,
    this.tenantId,
    this.url,
    this.position,
    this.textureTypeId,
    this.transparent,
    this.createdAt,
    this.updatedAt,
  });
}
