import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movil181/app/inject_dependencies.dart';
import 'package:movil181/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  injectDependencies();
  runApp(
    AppState(),
  );
}
