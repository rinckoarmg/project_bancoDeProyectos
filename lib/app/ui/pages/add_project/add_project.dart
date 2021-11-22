import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/project_model.dart';
import 'package:movil181/app/ui/pages/add_project/add_project_controller.dart';
import 'package:movil181/app/ui/pages/project/project_page.dart';
import 'package:movil181/app/ui/widgets/project_image.dart';

import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({Key? key}) : super(key: key);

  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  @override
  Widget build(BuildContext context) {
    final projectService = Provider.of<ProjectService>(context);
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => AddProjectController(projectService.selectedProject),
      child: AddProjectBody(projectService: projectService),
    );
  }
}

class AddProjectBody extends StatefulWidget {
  final ProjectService projectService;

  const AddProjectBody({Key? key, required this.projectService})
      : super(key: key);

  @override
  _AddProjectBodyState createState() => _AddProjectBodyState();
}

class _AddProjectBodyState extends State<AddProjectBody> {
  @override
  Widget build(BuildContext context) {
    final pService = Provider.of<AddProjectController>(context);
    final projectCopied = pService.project;
    final ProjectService projectService;

    return Scaffold(
      appBar: AppBarGeneral().appBarG(),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
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
                  child: Form(
                    key: pService.formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Title(
                            color: Colors.purple,
                            child: Text(
                              'Datos del Proyecto',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Monserrat',
                                fontSize: 20,
                                color: Colors.purple[800],
                              ),
                            )),
                        _categoria(projectCopied.category, pService),
                        _pais(projectCopied.country, pService),
                        _nombre(projectCopied.name, pService),
                        _descripcion(projectCopied.decription, pService),
                        _telefono(projectCopied.contact, pService),
                        _email(projectCopied.email, pService),
                        _web(projectCopied.web, pService),
                        _imagen(projectCopied.image),
                        _atribucion(projectCopied.atribution, pService),
                        SizedBox(height: 30)
                      ],
                    ),
                  )),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: widget.projectService.isSaving
              ? null
              : () async {
                  if (!pService.isValidForm()) return;
                  final String? imageUrl =
                      await widget.projectService.uploadPhoto();

                  if (imageUrl != null) pService.project.image = imageUrl;

                  await widget.projectService.saveProject(pService.project);
                  Navigator.of(context).pop();
                },
          child: widget.projectService.isSaving
              ? CircularProgressIndicator(color: Colors.white)
              : Icon(Icons.save)),
    );
  }

  Widget _categoria(String category, AddProjectController pService) {
    ProjectPage projectPage = ProjectPage();
    String _opcionSeleccionada = projectPage.textCategory(category);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Text(
            'Categoria:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Monserrat',
              fontSize: 20,
              color: Colors.purple[800],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: DropdownButtonFormField(
            isExpanded: true,
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              setState(() {
                _opcionSeleccionada = opt.toString();
              });
              value:
              pService.updateData(opt.toString(), 7);
            },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    final List<String> _categories = [
      'Seleccione una opción',
      'Fin de la Pobreza',
      'Hambre Cero',
      'Salud y Bienestar',
      'Educación de Calidad',
      'Igualdad de Género',
      'Agua Limpia y Saneamiento',
      'Energia Asequible y no Contaminante',
      'Trabajo Decente y Crecimiento Económico',
      'Industria, Innovación e Infraestructura',
      'Reducción de las Desigualdades',
      'Ciudades y Comunidades Sostenibles',
      'Producción y Consumo Responsables',
      'Acción por el Clima',
      'Vida Submarina',
      'Vida de Ecosistemas Terrestres',
      'Paz, Justicia e Instituciones Sólidas',
      'Alianzas para lograr los objetivos',
    ];
    _categories.forEach((i) {
      lista.add(DropdownMenuItem(
        child: Text(i),
        value: i,
      ));
    });
    return lista;
  }

  Widget _nombre(
    String name,
    AddProjectController pService,
  ) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Nombre del proyecto',
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: name,
              onChanged: (value) => pService.updateData(value, 1),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El nombre es obligatorio';
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _descripcion(String decription, AddProjectController pService) {
    var textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Descripción',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: decription,
              onChanged: (value) => pService.updateData(value, 4),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'La descripción es obligatoria';
              },
              maxLines: 15,
              minLines: 1,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }

  Widget _telefono(String contact, AddProjectController pService) {
    var textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Teléfono de contacto',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: contact,
              onChanged: (value) => pService.updateData(value, 2),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El teléfono es obligatorio';
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _email(String? email, AddProjectController pService) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Email',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: email,
              onChanged: (value) => pService.updateData(value, 5),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El email es obligatorio';
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _web(String? web, AddProjectController pService) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Website',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: web,
              onChanged: (value) => pService.updateData(value, 6),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'Ingresa una URL donde puedan encontrar más información';
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _pais(String? country, AddProjectController pService) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Pais',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: country,
              onChanged: (value) => pService.updateData(value, 3),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El país es obligatorio';
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _imagen(String image) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Imagen',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        SizedBox(
          //height: 150,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                ProjectImage(url: widget.projectService.selectedProject.image),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: IconButton(
                    //alignment: Alignment.topCenter,
                    icon: Icon(
                      Icons.add_a_photo,
                      size: 50,
                      color: Colors.deepPurple[200],
                    ),
                    onPressed: () async {
                      final ImagePicker picker = new ImagePicker();
                      final XFile? foto = await picker.pickImage(
                          source: ImageSource.gallery, imageQuality: 100);

                      if (foto == null) {
                        print('No seleccionó nada');
                        return;
                      }
                      //final File fotoPath = File(foto.path);
                      print('La imagen es ${foto.path}');
                      widget.projectService.updatePhoto(foto.path);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _atribucion(String? atribution, AddProjectController pService) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Autor de la imagen',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              initialValue: atribution,
              onChanged: (value) => pService.updateData(value, 8),
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'Ingresa el autor de la imagen';
              },
            ),
          ),
        ),
      ],
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        //para cerrar la alerta haciendo click afuera:
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text('Confirmacion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monserrat',
                  fontSize: 22,
                  color: Colors.purple[800],
                )),
            content: Text(
              '¿Estas seguro de crear este proyecto?',
              maxLines: 2,
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child:
                      Text('Cancelar', style: TextStyle(color: Colors.black))),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'Salvar',
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
