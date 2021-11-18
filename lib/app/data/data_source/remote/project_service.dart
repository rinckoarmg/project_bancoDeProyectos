import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movil181/app/domain/models/models.dart';

class ProjectService extends ChangeNotifier {
  final String _baseUrl = '...firebaseio.com';
  final List<Projects> listProjects = [];

  bool isLoading = true;

  ProjectService() {
    this.loadProjects();
  }
  // <List<Stores>>
  Future loadProjects() async {
    final url = Uri.https(_baseUrl, '');
    final resp = await http.get(url);
    final Map<String, dynamic> projectMap = json.decode(resp.body);
    print(projectMap);

    projectMap.forEach((key, value) {
      final tempProyects = Projects.fromMap(value);
      tempProyects.id = key;
      this.listProjects.add(tempProyects);
    });
    print(listProjects);
    this.isLoading = false;
    notifyListeners();
    return this.listProjects;
  }
}
