import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget logo() {
    return FadeInImage(
      placeholder: AssetImage('assets/jar-loading.gif'),
      width: 180,
      image: AssetImage('assets/Imagen1.png'),
    );
  }
}
