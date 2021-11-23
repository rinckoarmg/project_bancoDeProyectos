import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/pages/loading_screen/loading_screen_page.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class FilterHome extends StatelessWidget {
  const FilterHome({Key? key, required this.lista, required this.name})
      : super(key: key);
  final int lista;
  final String name;

  @override
  Widget build(BuildContext context) {
    final projectService = Provider.of<ProjectService>(context, listen: false);
    final textConverter = TextConverter();
    var listado;
    String icono = '';
    String texto = '';
    if (projectService.isLoading) return LoadingScreen();

    switch (lista) {
      case 0:
        listado = projectService.listProjects;
        break;
      case 1:
        listado = projectService.list1;
        icono = 'sdg-es-01.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 2:
        listado = projectService.list2;
        icono = 'sdg-es-02.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 3:
        listado = projectService.list3;
        icono = 'sdg-es-03.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 4:
        listado = projectService.list4;
        icono = 'sdg-es-04.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 5:
        listado = projectService.list5;
        icono = 'sdg-es-05.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 6:
        listado = projectService.list6;
        icono = 'sdg-es-06.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 7:
        listado = projectService.list7;
        icono = 'sdg-es-07.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 8:
        listado = projectService.list8;
        icono = 'sdg-es-08.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 9:
        listado = projectService.list9;
        icono = 'sdg-es-09.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 10:
        listado = projectService.list10;
        icono = 'sdg-es-10.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 11:
        listado = projectService.list11;
        icono = 'sdg-es-11.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 12:
        listado = projectService.list12;
        icono = 'sdg-es-12.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 13:
        listado = projectService.list13;
        icono = 'sdg-es-13.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 14:
        listado = projectService.list14;
        icono = 'sdg-es-14.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 15:
        listado = projectService.list15;
        icono = 'sdg-es-15.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 16:
        listado = projectService.list16;
        icono = 'sdg-es-16.png';
        texto = textConverter.infoCategory(icono);
        break;
      case 17:
        listado = projectService.list17;
        icono = 'sdg-es-17.png';
        texto = textConverter.infoCategory(icono);
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Monserrat',
            fontSize: 25,
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: ListView.builder(
              itemCount: listado.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      projectService.selectedProject = listado[index];
                      Navigator.pushNamed(context, Routes.PROJECT);
                    },
                    child: ProjectCard(
                      project: listado[index],
                    ),
                  ))),

      floatingActionButton: Row(
        children: <Widget>[
          SizedBox(width: 30),
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              viewInfo(context, icono, texto);
            },
            child: Icon(Icons.info_outline_rounded),
            backgroundColor: Colors.purple,
          ),
          Expanded(child: SizedBox()),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () => Navigator.pushNamed(context, Routes.ADDPROJECT),
            child: Icon(Icons.add),
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }

  void viewInfo(BuildContext context, String icono, String texto) {
    showDialog(
        context: context,
        //para cerrar la alerta haciendo click afuera:
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserrat',
                  fontSize: 22,
                  color: Colors.purple[800],
                ),
                textAlign: TextAlign.center),
            content: Column(
              //Para que se adapte el largo al contenido que tiene:
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      child: icono == null
                          ? Image(
                              image: AssetImage('assets/no-image.png'),
                              fit: BoxFit.cover)
                          : FadeInImage(
                              placeholder: AssetImage('assets/jar-loading.gif'),
                              image: AssetImage('assets/${icono}'),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  texto,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Ok',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Monserrat',
                      fontSize: 18,
                      color: Colors.purple[800],
                    ),
                  )),
            ],
          );
        });
  }
}
