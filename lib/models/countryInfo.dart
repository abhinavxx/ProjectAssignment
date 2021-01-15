// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.status,
    this.statusCode,
    this.version,
    this.total,
    this.limit,
    this.offset,
    this.access,
    this.data,
  });

  String status;
  int statusCode;
  String version;
  int total;
  int limit;
  int offset;
  String access;
  Map<String, Datum> data;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        status: json["status"],
        statusCode: json["status-code"],
        version: json["version"],
        total: json["total"],
        limit: json["limit"],
        offset: json["offset"],
        access: json["access"],
        data: Map.from(json["data"])
            .map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status-code": statusCode,
        "version": version,
        "total": total,
        "limit": limit,
        "offset": offset,
        "access": access,
        "data": Map.from(data)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Datum {
  Datum({
    this.country,
    this.region,
  });

  String country;
  Region region;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        country: json["country"],
        region: regionValues.map[json["region"]],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "region": regionValues.reverse[region],
      };
}

enum Region { ASIA, AFRICA, ANTARCTIC, CENTRAL_AMERICA }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Central America": Region.CENTRAL_AMERICA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
