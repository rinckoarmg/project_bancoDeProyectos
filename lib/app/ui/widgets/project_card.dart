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
        height: 200,
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
        ),
        
        child: Stack(
          children: [
            _CardImage(),
            _ProjectDetails(),
            Positioned(
              bottom: 5,
              right: 5,
              child: _CategorieIcon()
            )
          ],
          
        )
        
      ),
    );
  }
}

class _CategorieIcon extends StatelessWidget {
  const _CategorieIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child:
            FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: AssetImage('assets/Imagen1C.png'),
            fit: BoxFit.cover,
          ),
        )
      ),
      width: 50,
      height:50,
      decoration: BoxDecoration(
        color: Colors.yellow[800],
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25))
      ),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text('Nombre del Proyecto',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)
          )
        ),
      ),
      width: 200,
      height:40,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), bottomRight: Radius.circular(25))
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        //height: 300,
        child:
        FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: AssetImage('assets/no-image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}