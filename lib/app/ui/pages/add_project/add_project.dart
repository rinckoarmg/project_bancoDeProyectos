import 'package:flutter/material.dart';
import 'package:movil181/app/data/data_source/remote/project_service.dart';
import 'package:movil181/app/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class AddProjectPage extends StatelessWidget {
  const AddProjectPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Monserrat',
      fontSize: 20,
      color: Colors.purple[800],
    );
    return Scaffold(
      appBar: AppBarGeneral().appBarG(),
      body: Stack(children: [
        Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  //height: size.height * 0.7,
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
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: 25, left: 25),
                          child: Text(
                            'Nombre del proyecto',
                            textAlign: TextAlign.left,
                            style: textStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: 25, left: 25),
                          child: Text(
                            'Descripción',
                            textAlign: TextAlign.left,
                            style: textStyle,
                            maxLines: 10,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: 25, left: 25),
                          child: Text(
                            'Teléfono de contacto',
                            textAlign: TextAlign.left,
                            style: textStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: 25, left: 25),
                          child: Text(
                            'Email',
                            textAlign: TextAlign.left,
                            style: textStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 20, right: 25, left: 25),
                          child: Text(
                            'Website',
                            textAlign: TextAlign.left,
                            style: textStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: TextField(),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: FadeInImage(
                            height: 75,
                            placeholder: AssetImage('assets/jar-loading.gif'),
                            image: AssetImage('assets/no-image.png'),
                          ),
                        ),
                      ),
                    ],
                  )),
            )),
      ]),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.save)),
    );
  }
}
