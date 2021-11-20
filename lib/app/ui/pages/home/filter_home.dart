import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/pages/loading_screen/loading_screen.dart';
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
    var listado;
    if (projectService.isLoading) return LoadingScreen();

    switch (lista) {
      case 0:
        listado = projectService.listProjects;
        break;
      case 1:
        listado = projectService.list1;
        break;
      case 2:
        listado = projectService.list2;
        break;
      case 3:
        listado = projectService.list3;
        break;
      case 4:
        listado = projectService.list4;
        break;
      case 5:
        listado = projectService.list5;
        break;
      case 6:
        listado = projectService.list6;
        break;
      case 7:
        listado = projectService.list7;
        break;
      case 8:
        listado = projectService.list8;
        break;
      case 9:
        listado = projectService.list9;
        break;
      case 10:
        listado = projectService.list10;
        break;
      case 11:
        listado = projectService.list11;
        break;
      case 12:
        listado = projectService.list12;
        break;
      case 13:
        listado = projectService.list13;
        break;
      case 14:
        listado = projectService.list14;
        break;
      case 15:
        listado = projectService.list15;
        break;
      case 16:
        listado = projectService.list16;
        break;
      case 17:
        listado = projectService.list17;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Monserrat',
            fontSize: 18,
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
              _viewInfo(context);
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

  void _viewInfo(BuildContext context) {
    showDialog(
      context: context,
      //para cerrar la alerta haciendo click afuera:
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text('Titulo'),
          content: Column(
            //Para que se adapte el largo al contenido que tiene:
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la caja de alerta'),
              FlutterLogo(size: 100,),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar', style: TextStyle(color: Colors.black))
            ),
            TextButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text('Ok', style: TextStyle(color: Colors.black))
            ),
          ],

        );
      }
    );  
  }

}
