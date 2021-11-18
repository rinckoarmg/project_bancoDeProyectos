import 'package:flutter/material.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGeneral().appBarG(),
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 7.5),
                    blurRadius: 10,
                  )
                ]),
            child: Stack(
              children: [],
            )),
      )),
    );
  }
}
