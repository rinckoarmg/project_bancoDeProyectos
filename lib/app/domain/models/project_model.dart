// To parse required this JSON data, do
//
//     final stores = storesFromMap(jsonString);

import 'dart:convert';

class Projects {
  Projects({
    required this.description,
    required this.name,
    required this.image,
    required this.contact,
    this.web,
    this.id,
    required this.category,

  });

  String description;
  String name;
  String image;
  String contact;
  String? web;
  String? id;
  String category;

  factory Projects.fromJson(String str) => Projects.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Projects.fromMap(Map<String, dynamic> json) => Projects(
        description: json["description"],
        name: json["name"],
        image: json["image"],
        contact: json["contact"],
        web: json["web"],
        category: json["category"],
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "name": name,
        "image": image,
        "contact": contact,
        "web": web,
        "category": category,
      };
}
