part of 'models.dart';

class UserModel {
  String id;
  String eventId;
  String email;
  String emailVerifiedAt;
  String createdAt;
  String updatedAt;
  ExhibitorModel exhibitor;
  EventModel event;

  UserModel({
    this.id,
    this.eventId,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.exhibitor,
    this.event,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    UserModel data = UserModel(
      id: json['id'].toString(),
      eventId: json['event_id'].toString(),
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] ?? "",
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      exhibitor: ExhibitorModel.fromJson(json['exhibitor']),
      event: EventModel.fromJson(json['event']),
    );

    return data;
  }
}

class ExhibitorModel {
  String name;
  String email;
  String premiumLevel;
  String createdAt;
  String updatedAt;
  List<dynamic> boothTextures = [];

  ExhibitorModel({
    this.name,
    this.email,
    this.premiumLevel,
    this.createdAt,
    this.updatedAt,
  });

  factory ExhibitorModel.fromJson(Map<String, dynamic> json) {
    ExhibitorModel data = ExhibitorModel(
      name: json['name'],
      email: json['email'],
      premiumLevel: json['premium_level'].toString(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

    final List<dynamic> list = (json['booth_textures']
        .map((e) => BoothTextureModel.fromJson(e))
        .toList());
    data.boothTextures.addAll(list);

    return data;
  }
}

class BoothTextureModel {
  String url;
  String textureTypeId;
  String position;
  String createdAt;
  String updatedAt;

  BoothTextureModel({
    this.url,
    this.textureTypeId,
    this.position,
    this.createdAt,
    this.updatedAt,
  });

  factory BoothTextureModel.fromJson(Map<String, dynamic> json) {
    BoothTextureModel data = BoothTextureModel(
      url: json['url'],
      textureTypeId: json['texture_type_id'].toString(),
      position: json['position'].toString(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

    return data;
  }
}

class EventModel {
  String id;
  String identifier;
  String name;
  String url;
  String createdAt;
  String updatedAt;

  EventModel({
    this.id,
    this.identifier,
    this.name,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    EventModel data = EventModel(
      id: json['id'].toString(),
      identifier: json['identifier'],
      name: json['name'],
      url: json['url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

    return data;
  }
}
