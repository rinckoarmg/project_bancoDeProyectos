// To parse this JSON data, do
//
//     final projects = projectsFromMap(jsonString);

import 'dart:convert';

class Projects {
  Projects({
    required this.category,
    required this.contact,
    required this.decription,
    required this.image,
    required this.name,
    this.web,
    this.id,
  });

  String category;
  String contact;
  String decription;
  String image;
  String name;
  String? web;
  String? id;

  factory Projects.fromJson(String str) => Projects.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Projects.fromMap(Map<String, dynamic> json) => Projects(
        category: json["category"],
        contact: json["contact"],
        decription: json["decription"],
        image: json["image"],
        name: json["name"],
        web: json["web"],
      );

  Map<String, dynamic> toMap() => {
        "category": category,
        "contact": contact,
        "decription": decription,
        "image": image,
        "name": name,
        "web": web,
      };
}
