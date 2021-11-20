import 'package:flutter/material.dart';
import 'package:movil181/app/domain/models/models.dart';

class AddProjectController extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Projects project;

  //constructor:
  AddProjectController(
      this.project); //es importante que el proyecto que se envie sea una copia.
  /*
  updateAvailability(bool value) {
    print('IMPRESION EN CONSOLA del value: $value');
    this.project. = value;
    notifyListeners();
  }
  */
  bool isValidForm() {
    print(project.name);
    print(project.category);
    print(project.contact);
    print(project.decription);
    print(project.email);
    print(project.id);
    print(project.image);
    print(project.web);

    return formKey.currentState?.validate() ?? false;
  }
}
