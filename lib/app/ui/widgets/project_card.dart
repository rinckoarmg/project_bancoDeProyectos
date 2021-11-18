import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  //const ProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0,7.5),
              blurRadius: 10,
            )
          ]
        )
      ),
    );
  }
}