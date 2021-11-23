import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movil181/app/domain/models/models.dart';

class ProjectService extends ChangeNotifier {
  final String _baseUrl = 'ods-app-e4d91-default-rtdb.firebaseio.com';
  final List<Projects> listProjects = [];
  final List<Projects> list1 = [];
  final List<Projects> list2 = [];
  final List<Projects> list3 = [];
  final List<Projects> list4 = [];
  final List<Projects> list5 = [];
  final List<Projects> list6 = [];
  final List<Projects> list7 = [];
  final List<Projects> list8 = [];
  final List<Projects> list9 = [];
  final List<Projects> list10 = [];
  final List<Projects> list11 = [];
  final List<Projects> list12 = [];
  final List<Projects> list13 = [];
  final List<Projects> list14 = [];
  final List<Projects> list15 = [];
  final List<Projects> list16 = [];
  final List<Projects> list17 = [];

  late Projects selectedProject;

  File? newPhoto;
  bool isLoading = true;
  bool isSaving = false;

  ProjectService() {
    loadProjects();
  }

  Future<List<Projects>> loadProjects() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, '/project.json');
    final resp = await http.get(url);
    final Map<String, dynamic> projectMap = json.decode(resp.body);
    //print(projectMap);

    projectMap.forEach((key, value) {
      final tempProjects = Projects.fromMap(value);
      tempProjects.id = key;
      listProjects.add(tempProjects);

      if (tempProjects.category == 'sdg-es-01.png') {
        list1.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-02.png') {
        list2.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-03.png') {
        list3.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-04.png') {
        list4.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-05.png') {
        list5.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-06.png') {
        list6.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-07.png') {
        list7.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-08.png') {
        list8.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-09.png') {
        list9.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-10.png') {
        list10.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-11.png') {
        list11.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-12.png') {
        list12.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-13.png') {
        list13.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-14.png') {
        list14.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-15.png') {
        list15.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-16.png') {
        list16.add(tempProjects);
      }
      if (tempProjects.category == 'sdg-es-17.png') {
        list17.add(tempProjects);
      }
    });

    isLoading = false;
    notifyListeners();

    //print(listProjects);
    return listProjects;
  }

  Future saveProject(Projects project) async {
    isSaving = true;
    notifyListeners();

    if (project.id == null) {
      await createProject(project);
    } else {
      await this.updateProject(project);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProject(Projects project) async {
    final url = Uri.https(_baseUrl, '/project/${project.id}.json');
    final resp = await http.put(url, body: project.toJson());
    final decodeData = resp.body;

    print(decodeData);

    final index = listProjects.indexWhere((i) => i.id == project.id);
    listProjects[index] = project;
    return project.id!;
  }

  Future<String> createProject(Projects project) async {
    final url = Uri.https(_baseUrl, '/project.json');
    final resp = await http.post(url, body: project.toJson());
    final decodeData = json.decode(resp.body);

    project.id = decodeData['name'];

    this.listProjects.add(project);
    return project.id!;
  }

  void updatePhoto(String path) {
    selectedProject.image = path;
    newPhoto = File.fromUri(Uri(path: path));
    notifyListeners();
  }

  Future<String?> uploadPhoto() async {
    if (newPhoto == null) return null;
    isSaving = true;
    notifyListeners();

    final url = Uri.parse(
        'https://api.cloudinary.com/v1_1/rinckoar/image/upload?upload_preset=odsxcambio');

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('file', newPhoto!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final res = await http.Response.fromStream(streamResponse);

    if (res.statusCode != 200 && res.statusCode != 201) {
      print('error');
      print(res.body);
      return null;
    }
    newPhoto = null;

    final decodeData = json.decode(res.body);
    return decodeData['secure_url'];
  }
}
