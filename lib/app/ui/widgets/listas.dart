import 'package:flutter/material.dart';

class Listas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  List<String> listIcons(){
    List<String> listIcons = [
      'sdg-es-01.png','sdg-es-02.png','sdg-es-03.png','sdg-es-04.png','sdg-es-05.png','sdg-es-06.png','sdg-es-07.png','sdg-es-08.png','sdg-es-09.png',
      'sdg-es-10.png','sdg-es-11.png','sdg-es-12.png','sdg-es-13.png','sdg-es-14.png','sdg-es-15.png','sdg-es-16.png','sdg-es-17.png'
    ];
    return listIcons;
  }

  List<String> listCategories(){
    List<String> listCategories = [
      'Fin de la Pobreza','Hambre Cero','Salud y Bienestar','Educación de Calidad','Igualdad de Género','Agua Limpia y Saneamiento','Energia Asequible y no Contaminante',
      'Trabajo Decente y Crecimiento Económico','Industria, Innovación e Infraestructura','Reducción de las Desigualdades','Ciudades y Comunidades Sostenibles',
      'Producción y Consumo Responsables','Acción por el Clima','Vida Submarina','Vida de Ecosistemas Terrestres','Paz, Justicia e Instituciones Sólidas','Alianzas para lograr los objetivos'
    ];
    return listCategories; 
  }
}