import 'dart:convert';

DispostionsModel dispostionsModelFromJson(String str) =>
    DispostionsModel.fromJson(json.decode(str));

String dispostionsModelToJson(DispostionsModel data) =>
    json.encode(data.toJson());

class DispostionsModel {
  DispostionsModel({
    required this.message,
    required this.disposition,
    required this.subdisposition,
  });

  String message;
  List<Disposition> disposition;
  List<Subdisposition> subdisposition;

  factory DispostionsModel.fromJson(Map<String, dynamic> json) =>
      DispostionsModel(
        message: json["message"],
        disposition: List<Disposition>.from(
            json["disposition"].map((x) => Disposition.fromJson(x))),
        subdisposition: List<Subdisposition>.from(
            json["subdisposition"].map((x) => Subdisposition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "disposition": List<dynamic>.from(disposition.map((x) => x.toJson())),
        "subdisposition":
            List<dynamic>.from(subdisposition.map((x) => x.toJson())),
      };
}

class Disposition {
  Disposition({
    required this.dispoid,
    required this.dispo,
  });

  String dispoid;
  String dispo;

  factory Disposition.fromJson(Map<String, dynamic> json) => Disposition(
        dispoid: json["dispoid"],
        dispo: json["dispo"],
      );

  Map<String, dynamic> toJson() => {
        "dispoid": dispoid,
        "dispo": dispo,
      };
}

class Subdisposition {
  Subdisposition({
    required this.id,
    required this.dispoid,
    required this.subDispo,
  });

  int id;
  String dispoid;
  String subDispo;

  factory Subdisposition.fromJson(Map<String, dynamic> json) => Subdisposition(
        id: json["id"],
        dispoid: json["dispoid"],
        subDispo: json["sub_dispo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dispoid": dispoid,
        "sub_dispo": subDispo,
      };
}
