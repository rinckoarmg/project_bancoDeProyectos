import 'package:flutter/material.dart';

class ViewInfoCategory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void viewInfo(BuildContext context, String icono, String texto, String name) {
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