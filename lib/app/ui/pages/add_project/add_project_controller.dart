import 'package:flutter/material.dart';
import 'package:movil181/app/domain/models/models.dart';

class AddProjectController extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Projects project;

  //constructor:
  AddProjectController(
      this.project); //es importante que el proyecto que se envie sea una copia.

  updateData(String value, int dato) {
    print('IMPRESION EN CONSOLA del value: $value');
    switch (dato) {
      case 1:
        this.project.name = value;
        break;
      case 2:
        this.project.contact = value;
        break;
      case 3:
        this.project.country = value;
        break;
      case 4:
        this.project.decription = value;
        break;
      case 5:
        this.project.email = value;
        break;
      case 6:
        this.project.web = value;
        break;
      case 7:
        this.project.category = value;
        break;
      case 8:
        this.project.name = value;
        break;

      default:
    }
    notifyListeners();
  }

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
