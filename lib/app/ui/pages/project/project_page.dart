import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/project_service.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final projectService = Provider.of<ProjectService>(context);

    return Scaffold(
      appBar: AppBarGeneral().appBarG(),
      body: Stack(children: [
        _backgroungImage(imagen: projectService.selectedProject.image),
        Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      //height: 410,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Text(
                                projectService.selectedProject.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Monserrat',
                                  fontSize: 24,
                                  color: Colors.purple[800],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                            child: Text(
                              projectService.selectedProject.decription,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                              maxLines: 12,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            child: Row(
                                children: [
                                  FadeInImage(
                                    height: 75,
                                    placeholder: AssetImage('assets/jar-loading.gif'),
                                    image: AssetImage(
                                        'assets/${projectService.selectedProject.category}'),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        _textCategory(projectService.selectedProject.category),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Monserrat',
                                          fontSize: 20,
                                          color: Colors.purple[800],
                                        ),
                                        maxLines: 3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      )),
                ],
              ),
            )),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _viewContact(
          context,
          projectService.selectedProject.contact,
          projectService.selectedProject.email,
          projectService.selectedProject.web),
        child: Icon(Icons.contact_mail)),
    );
  }

  String _textCategory(String string){
    if (string == 'sdg-es-01.png') {
      return 'Fin de la Pobreza';      
    } if (string == 'sdg-es-02.png') {
      return 'Hambre Cero';
    } if (string == 'sdg-es-03.png') {
      return 'Salud y Bienestar';
    } if (string == 'sdg-es-04.png') {
      return 'Educación de Calidad';
    } if (string == 'sdg-es-05.png') {
      return 'Igualdad de Género';
    } if (string == 'sdg-es-06.png') {
      return 'Agua Limpia y Saneamiento';
    } if (string == 'sdg-es-07.png') {
      return 'Energia Asequible y no Contaminante';
    } if (string == 'sdg-es-08.png') {
      return 'Trabajo Decente y Crecimiento Económico';
    } if (string == 'sdg-es-09.png') {
      return 'Industria, Innovación e Infraestructura';
    } if (string == 'sdg-es-10.png') {
      return 'Reducción de las Desigualdades';
    } if (string == 'sdg-es-11.png') {
      return 'Ciudades y Comunidades Sostenibles';
    } if (string == 'sdg-es-12.png') {
      return 'Producción y Consumo Responsables';
    } if (string == 'sdg-es-13.png') {
      return 'Acción por el Clima';
    } if (string == 'sdg-es-14.png') {
      return 'Vida Submarina';
    } if (string == 'sdg-es-15.png') {
      return 'Vida de Ecosistemas Terrestres';
    } if (string == 'sdg-es-16.png') {
      return 'Paz, Justicia e Instituciones Sólidas';
    } if (string == 'sdg-es-17.png') {
      return 'Alianzas para lograr los objetivos';
    } else {
      return 'La categoria NO existe!';
    }
    
  }

  _viewContact(BuildContext context, String? tel, String? email, String? web) {
    showDialog(
        context: context,
        //para cerrar la alerta haciendo click afuera:
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              "Conectate con este proyecto!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Monserrat',
                fontSize: 22,
                color: Colors.purple[800],
              ),
            ),
            content: Column(
              //Para que se adapte el largo al contenido que tiene:
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    SizedBox(height: 25),
                    Text(
                      "Teléfono: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserrat',
                        fontSize: 18,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(tel!),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Email: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserrat',
                        fontSize: 18,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(email!),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Web: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Monserrat',
                        fontSize: 18,
                        color: Colors.purple[800],
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(web!),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              // TextButton(
              //     onPressed: () => Navigator.of(context).pop(),
              //     child:
              //         Text('Cancelar', style: TextStyle(color: Colors.black))),
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

class _backgroungImage extends StatelessWidget {
  final String? imagen;

  const _backgroungImage({Key? key, this.imagen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.green,
      width: double.infinity,
      height: size.height * 0.40,
      child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(imagen!)),
    );
  }
}
