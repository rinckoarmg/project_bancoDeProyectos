import 'package:flutter/material.dart';
import 'package:movil181/app/domain/models/models.dart';

class AddProjectController extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Projects project;

  //constructor:
  AddProjectController(
      this.project); //es importante que el proyecto que se envie sea una copia.

  updateData(String value, int dato) {
    //print('IMPRESION EN CONSOLA del value: $value');
    switch (dato) {
      case 1:
        //this.project.id = value + '1';
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
        if (value == 'Fin de la Pobreza') {
          this.project.category = 'sdg-es-01.png';
        }
        if (value == 'Hambre Cero') {
          this.project.category = 'sdg-es-02.png';
        }
        if (value == 'Salud y Bienestar') {
          this.project.category = 'sdg-es-03.png';
        }
        if (value == 'Educación de Calidad') {
          this.project.category = 'sdg-es-04.png';
        }
        if (value == 'Igualdad de Género') {
          this.project.category = 'sdg-es-05.png';
        }
        if (value == 'Agua Limpia y Saneamiento') {
          this.project.category = 'sdg-es-06.png';
        }
        if (value == 'Energia Asequible y no Contaminante') {
          this.project.category = 'sdg-es-07.png';
        }
        if (value == 'Trabajo Decente y Crecimiento Económico') {
          this.project.category = 'sdg-es-08.png';
        }
        if (value == 'Industria, Innovación e Infraestructura') {
          this.project.category = 'sdg-es-09.png';
        }
        if (value == 'Reducción de las Desigualdades') {
          this.project.category = 'sdg-es-10.png';
        }
        if (value == 'Ciudades y Comunidades Sostenibles') {
          this.project.category = 'sdg-es-11.png';
        }
        if (value == 'Producción y Consumo Responsables') {
          this.project.category = 'sdg-es-12.png';
        }
        if (value == 'Acción por el Clima') {
          this.project.category = 'sdg-es-13.png';
        }
        if (value == 'Vida Submarina') {
          this.project.category = 'sdg-es-14.png';
        }
        if (value == 'Vida de Ecosistemas Terrestres') {
          this.project.category = 'sdg-es-15.png';
        }
        if (value == 'Paz, Justicia e Instituciones Sólidas') {
          this.project.category = 'sdg-es-16.png';
        }
        if (value == 'Alianzas para lograr los objetivos') {
          this.project.category = 'sdg-es-17.png';
        }
        //print(this.project.category);
        break;
      case 8:
        this.project.atribution = value;
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
