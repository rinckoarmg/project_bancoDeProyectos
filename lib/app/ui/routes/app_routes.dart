import 'package:flutter/widgets.dart' show BuildContext, Container, Widget;
import 'package:movil181/app/ui/pages/add_project/add_project.dart';
import 'package:movil181/app/ui/pages/home/home_page.dart';
import 'package:movil181/app/ui/pages/login/login_page.dart';
import 'package:movil181/app/ui/pages/project/project_page.dart';
import 'package:movil181/app/ui/pages/register/register_page.dart';
import 'package:movil181/app/ui/pages/splash/splash_page.dart';
import 'package:movil181/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.SPLASH: (_) => const SplashPage(),
      Routes.LOGIN: (_) => const LoginPage(),
      Routes.REGISTER: (_) => const RegisterPage(),
      Routes.HOME: (_) => const HomePage(),
      Routes.PROJECT: (_) => const ProjectPage(),
      Routes.PROJECT: (_) => const ProjectPage(),
      Routes.ADDPROJECT: (_) => const AddProjectPage(),
    };
