import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movil181/app/data/data_source/remote/services.dart';
import 'package:movil181/app/domain/models/project_model.dart';
import 'package:movil181/app/ui/pages/add_project/add_project_controller.dart';

import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({Key? key}) : super(key: key);

  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  String _opcionSeleccionada = 'Fin de la Pobreza';

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
  const AddProjectBody({Key? key, required this.projectService})
      : super(key: key);

  final ProjectService projectService;

  @override
  _AddProjectBodyState createState() => _AddProjectBodyState();
}

class _AddProjectBodyState extends State<AddProjectBody> {
  String _opcionSeleccionada = 'Seleccione una opción';
  List<String> _categories = [
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
  @override
  Widget build(BuildContext context) {
    final projectService = Provider.of<ProjectService>(context);
    final projectController = Provider.of<AddProjectController>(context);
    final project = projectController.project;

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
                    key: projectController.formKey,
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
                        _categoria(),
                        _pais(projectService.selectedProject.copy()),
                        _nombre(projectService.selectedProject.copy()),
                        _descripcion(projectService.selectedProject.copy()),
                        _telefono(projectService.selectedProject.copy()),
                        _email(projectService.selectedProject.copy()),
                        _web(projectService.selectedProject.copy()),
                        _imagen(projectService.selectedProject.copy()),
                        SizedBox(height: 30)
                      ],
                    ),
                  )),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _mostrarAlert(context), child: Icon(Icons.save)),
    );
  }

  Widget _categoria() {
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
          child: DropdownButton(
            isExpanded: true,
            value: _opcionSeleccionada,
            items: getOpcionesDropdown(),
            onChanged: (opt) {
              print(opt);
              setState(() {
                _opcionSeleccionada = opt.toString();
              });
            },
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    _categories.forEach((i) {
      lista.add(DropdownMenuItem(
        child: Text(i),
        value: i,
      ));
    });
    return lista;
  }

  Widget _nombre(Projects projectCopy) {
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
              initialValue: projectCopy.name,
              onChanged: (value) => projectCopy.name = value,
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

  Widget _descripcion(Projects projectCopy) {
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
              onChanged: (value) => projectCopy.decription = value,
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'La descripción es obligatoria';
              },
              initialValue: projectCopy.decription,
              maxLines: 15,
              minLines: 1,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }

  Widget _telefono(Projects projectCopy) {
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
              onChanged: (value) => projectCopy.contact = value,
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El teléfono es obligatorio';
              },
              initialValue: projectCopy.contact,
            ),
          ),
        ),
      ],
    );
  }

  Widget _email(Projects projectCopy) {
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
              onChanged: (value) => projectCopy.email = value,
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El email es obligatorio';
              },
              initialValue: projectCopy.email,
            ),
          ),
        ),
      ],
    );
  }

  Widget _web(Projects projectCopy) {
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
              onChanged: (value) => projectCopy.web = value,
              initialValue: projectCopy.web,
            ),
          ),
        ),
      ],
    );
  }

  Widget _pais(Projects projectCopy) {
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
              onChanged: (value) => projectCopy.country = value,
              validator: (value) {
                if (value == null || value.length < 1)
                  return 'El país es obligatorio';
              },
              initialValue: projectCopy.country,
            ),
          ),
        ),
      ],
    );
  }

  Widget _imagen(Projects projectCopy) {
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                      placeholder: AssetImage('assets/no-image.png'),
                      image: NetworkImage(projectCopy.image)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: IconButton(
                    //alignment: Alignment.topCenter,
                    icon: Icon(
                      Icons.photo_camera_rounded,
                      size: 50,
                      color: Colors.deepPurple,
                    ),
                    onPressed: () async {
                      final picker = new ImagePicker();
                      final PickedFile? pickedFile = (await picker.pickImage(
                          source: ImageSource.camera,
                          imageQuality: 100)) as PickedFile?;

                      if (pickedFile == null) {
                        print('No seleccionó nada');
                        return;
                      }
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

  void _mostrarAlert(BuildContext context) {
    final pc = Provider.of<AddProjectController>(context, listen: false);
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
                  onPressed: () {
                    pc.isValidForm();
                  },
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
