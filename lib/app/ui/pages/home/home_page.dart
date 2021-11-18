import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/ui/pages/loading_screen/loading_screen.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final projectService = Provider.of<ProjectService>(context);
    if (projectService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBarGeneral().appBarG(),
      body: Padding(
        padding: EdgeInsets.only(bottom: 50),
        child: ListView.builder(
          itemCount: projectService.listProjects.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: (){
              projectService.selectedProject = projectService.listProjects[index];
              Navigator.pushNamed(context, Routes.PROJECT);
            },
            child: ProjectCard(
              project: projectService.listProjects[index],
            ),
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
