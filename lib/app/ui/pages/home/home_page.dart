import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/models.dart';
import 'package:movil181/app/ui/pages/home/filter_home.dart';
import 'package:movil181/app/ui/pages/loading_screen/loading_screen.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

import 'package:flutter_meedu/flutter_meedu.dart' as meedu;
import 'package:movil181/app/domain/repositories/authentication_repository.dart';
import 'package:flutter_meedu/router.dart' as router;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projectService = Provider.of<ProjectService>(context);
    if (projectService.isLoading) return LoadingScreen();
    final List<Projects> lista = projectService.listProjects;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        leading: PopupMenuButton<int>(
            icon: Icon(Icons.menu),
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Fin de la pobreza'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('Hambre cero'),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text('Salud y bienestar'),
                  ),
                  const PopupMenuItem(
                    value: 4,
                    child: Text('Educación de calidad'),
                  ),
                  const PopupMenuItem(
                    value: 5,
                    child: Text('Igualdad de género'),
                  ),
                  const PopupMenuItem(
                    value: 6,
                    child: Text('Agua limpia y saneamiento'),
                  ),
                  const PopupMenuItem(
                    value: 7,
                    child: Text('Energía asequible y no contaminante'),
                  ),
                  const PopupMenuItem(
                    value: 8,
                    child: Text('Trabajo decente y crecimiento económico'),
                  ),
                  const PopupMenuItem(
                    value: 9,
                    child: Text('Industria, innovación e infraestructura'),
                  ),
                  const PopupMenuItem(
                    value: 10,
                    child: Text('Reducción de las desigualdades'),
                  ),
                  const PopupMenuItem(
                    value: 11,
                    child: Text('Ciudades y comunidades sostenibles'),
                  ),
                  const PopupMenuItem(
                    value: 12,
                    child: Text('Producción y consumo responsables'),
                  ),
                  const PopupMenuItem(
                    value: 13,
                    child: Text('Acción por el clima'),
                  ),
                  const PopupMenuItem(
                    value: 14,
                    child: Text('Vida submarina'),
                  ),
                  const PopupMenuItem(
                    value: 15,
                    child: Text('Vida de ecosistemas terrestres'),
                  ),
                  const PopupMenuItem(
                    value: 16,
                    child: Text('Paz, justicia e instituciones sólidas'),
                  ),
                  const PopupMenuItem(
                    value: 17,
                    child: Text('Alianzas para lograr los objetivos'),
                  ),
                ]),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ODS -',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserrat',
                fontSize: 25,
                color: Colors.purple,
              ),
            ),
            Text(
              ' Por',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserrat',
                fontSize: 25,
                color: Colors.amber,
              ),
            ),
            Text(
              ' el',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserrat',
                fontSize: 25,
                color: Colors.indigo,
              ),
            ),
            Text(
              ' Cambio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserrat',
                fontSize: 25,
                color: Colors.green,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () async {
                await meedu.Get.i.find<AuthenticationRepository>().signOut();
                router.pushNamedAndRemoveUntil(Routes.LOGIN);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: ListView.builder(
              itemCount: projectService.listProjects.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                    onTap: () {
                      projectService.selectedProject =
                          projectService.listProjects[index];
                      Navigator.pushNamed(context, Routes.PROJECT);
                    },
                    child: ProjectCard(
                      project: projectService.listProjects[index],
                    ),
                  ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          projectService.selectedProject = new Projects(
              category: 'sdg-es-07.png',
              contact: '',
              decription: '',
              image: 'https://picsum.photos/400/300',
              name: '',
              atribution: 'autor');
          Navigator.pushNamed(context, Routes.ADDPROJECT);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}

void onSelected(BuildContext context, int item) {
  //final projectService = Provider.of<ProjectService>(context, listen: false);
  switch (item) {
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 1, name: 'Fin de la pobreza')));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 2, name: 'Hambre cero')));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 3, name: 'Salud y bienestar')));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 4, name: 'Educación de calidad')));
      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 5, name: 'Igualdad de género')));
      break;
    case 6:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 6, name: 'Agua limpia y saneamiento')));
      break;
    case 7:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(
              lista: 7, name: 'Energía asequible y no contaminante')));
      break;
    case 8:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(
              lista: 8, name: 'Trabajo decente y crecimiento económico')));
      break;
    case 9:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(
              lista: 9, name: 'Industria, innovación e infraestructura')));
      break;
    case 10:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 10, name: 'Reducción de las desigualdades')));
      break;
    case 11:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(
              lista: 11, name: 'Ciudades y comunidades sostenibles')));
      break;
    case 12:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(
              lista: 12, name: 'Producción y consumo responsables')));
      break;
    case 13:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 13, name: 'Acción por el clima')));
      break;
    case 14:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(lista: 14, name: 'Vida submarina')));
      break;
    case 15:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilterHome(lista: 15, name: 'Vida de ecosistemas terrestres')));
      break;
    case 16:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(
              lista: 16, name: 'Paz, justicia e instituciones sólidas')));
      break;
    case 17:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterHome(
              lista: 17, name: 'Alianzas para lograr los objetivos')));
      break;
  }
}
