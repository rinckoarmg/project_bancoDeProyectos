import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movil181/app/domain/models/models.dart';

class ProjectService extends ChangeNotifier {
  final String _baseUrl = 'ods-app-e4d91-default-rtdb.firebaseio.com';
  final List<Projects> listProjects = [];
  late Projects selectedProject;
  bool isLoading = true;

  ProjectService() {
    this.loadProjects();
  }
  
  Future <List<Projects>> loadProjects() async {
    final url = Uri.https(_baseUrl, '/project.json');
    final resp = await http.get(url);
    final Map<String, dynamic> projectMap = json.decode(resp.body);
    print(projectMap);

    projectMap.forEach((key, value) {
      final tempProjects = Projects.fromMap(value);
      tempProjects.id = key;
      this.listProjects.add(tempProjects);
    });

    print(listProjects);
    this.isLoading = false;
    notifyListeners();

    print(listProjects);
    return this.listProjects;
  }
}
