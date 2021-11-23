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
    final Listas listaIconos = Listas();
    final projectService = Provider.of<ProjectService>(context, listen: false);
    final textConverter = TextConverter();
    List listado =[];
    String icono = '';
    String texto = '';
    if (projectService.isLoading) return LoadingScreen();
    
    for (int i=0; i<listaIconos.listIcons().length; i++) {
      if (lista == i+1) {
        listado = projectService.listaGeneral[i];
        icono = listaIconos.listIcons().elementAt(i);
        texto = textConverter.infoCategory(icono);
      } 
    }
    
    /*
    switch (lista) {
      case 0:
        listado = projectService.listProjects;
        break;
      case 1:
        listado = projectService.listaGeneral[0];
        icono = listaIconos.listIcons().elementAt(0);
        texto = textConverter.infoCategory(icono);
        break;
      case 2:
        listado = projectService.listaGeneral[1];
        icono = listaIconos.listIcons().elementAt(1);
        texto = textConverter.infoCategory(icono);
        break;
      case 3:
        listado = projectService.listaGeneral[2];
        icono = listaIconos.listIcons().elementAt(2);
        texto = textConverter.infoCategory(icono);
        break;
      case 4:
        listado = projectService.listaGeneral[3];
        icono = listaIconos.listIcons().elementAt(3);
        texto = textConverter.infoCategory(icono);
        break;
      case 5:
        listado = projectService.listaGeneral[4];
        icono = listaIconos.listIcons().elementAt(4);
        texto = textConverter.infoCategory(icono);
        break;
      case 6:
        listado = projectService.listaGeneral[5];
        icono = listaIconos.listIcons().elementAt(5);
        texto = textConverter.infoCategory(icono);
        break;
      case 7:
        listado = projectService.listaGeneral[6];
        icono = listaIconos.listIcons().elementAt(6);
        texto = textConverter.infoCategory(icono);
        break;
      case 8:
        listado = projectService.listaGeneral[7];
        icono = listaIconos.listIcons().elementAt(7);
        texto = textConverter.infoCategory(icono);
        break;
      case 9:
        listado = projectService.listaGeneral[8];
        icono = listaIconos.listIcons().elementAt(8);
        texto = textConverter.infoCategory(icono);
        break;
      case 10:
        listado = projectService.listaGeneral[9];
        icono = listaIconos.listIcons().elementAt(9);
        texto = textConverter.infoCategory(icono);
        break;
      case 11:
        listado = projectService.listaGeneral[10];
        icono = listaIconos.listIcons().elementAt(10);
        texto = textConverter.infoCategory(icono);
        break;
      case 12:
        listado = projectService.listaGeneral[11];
        icono = listaIconos.listIcons().elementAt(11);
        texto = textConverter.infoCategory(icono);
        break;
      case 13:
        listado = projectService.listaGeneral[12];
        icono = listaIconos.listIcons().elementAt(12);
        texto = textConverter.infoCategory(icono);
        break;
      case 14:
        listado = projectService.listaGeneral[13];
        icono = listaIconos.listIcons().elementAt(13);
        texto = textConverter.infoCategory(icono);
        break;
      case 15:
        listado = projectService.listaGeneral[14];
        icono = listaIconos.listIcons().elementAt(14);
        texto = textConverter.infoCategory(icono);
        break;
      case 16:
        listado = projectService.listaGeneral[15];
        icono = listaIconos.listIcons().elementAt(15);
        texto = textConverter.infoCategory(icono);
        break;
      case 17:
        listado = projectService.listaGeneral[16];
        icono = listaIconos.listIcons().elementAt(16);
        texto = textConverter.infoCategory(icono);
        break;
    }
    */

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
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
