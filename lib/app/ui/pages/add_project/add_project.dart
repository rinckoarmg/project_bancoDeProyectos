import 'package:flutter/material.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';

class AddProjectPage extends StatefulWidget {
  const AddProjectPage({Key? key}) : super(key: key);

  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  String _opcionSeleccionada = 'Todas las Categorías';
  final List<String> _categories = [
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
    'Todas las Categorías'
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarGeneral().appBarG(),
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _categoria(),
                        _nombre(),
                        _descripcion(),
                        _telefono(),
                        _email(),
                        _web(),
                        // _pais(),
                        // _imagen(),
                        SizedBox(height: 30)
                      ],
                    )),
              )),
        ]),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.save)),
    );
  }


  Widget _categoria() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
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
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            print(opt);
            setState(() {
              _opcionSeleccionada = opt.toString();
            });
          },
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

  Widget _nombre() {
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
            child: TextField(),
          ),
        ),
      ],
    );
  }

  // Widget _imagen() {}

  // Widget _pais() {}

  // Widget _categoria() {}

  Widget _web() {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Website',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(),
        ),
      ],
    );
  }

  Widget _email() {
    final textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Email',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(),
        ),
      ],
    );
  }

  Widget _telefono() {
    var textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Teléfono de contacto',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(),
        ),
      ],
    );
  }

  Widget _descripcion() {
    var textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, right: 25, left: 25),
          child: Text(
            'Descripción',
            textAlign: TextAlign.left,
            style: textStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            maxLines: 15,
            minLines: 1,
            textAlign: TextAlign.justify,

          ),
        ),
      ],
    );
  }

}