// To parse this JSON data, do
//
//     final modelList = modelListFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ModelList? modelListFromJson(String str) =>
    ModelList.fromJson(json.decode(str));

String modelListToJson(ModelList? data) => json.encode(data!.toJson());

class ModelList extends Equatable {
  const ModelList({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<Datum?> data;
  final Support? support;

  factory ModelList.fromJson(Map<String, dynamic> json) => ModelList(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null
            ? []
            : List<Datum?>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        support: Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data":
            data == [] ? [] : List<dynamic>.from(data.map((x) => x!.toJson())),
        "support": support!.toJson(),
      };

  @override
  List<Object?> get props => [
        page,
        perPage,
        total,
        totalPages,
        data,
        support,
      ];
}

class Datum extends Equatable {
  const Datum({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        avatar,
      ];
}

class Support extends Equatable {
  const Support({
    required this.url,
    required this.text,
  });

  final String? url;
  final String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };

  @override
  List<Object?> get props => [url, text];
}
