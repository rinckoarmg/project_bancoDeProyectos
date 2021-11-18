import 'package:flutter/material.dart';
import 'package:movil181/app/domain/responses/sing_in_responses.dart';
import 'package:movil181/app/ui/pages/login/login_page.dart' show loginProvider;
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/dialogs/dialogs.dart';
import 'package:movil181/app/ui/widgets/dialogs/progress_dialog.dart';
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      String errorMessage = "";

      switch (response.error) {
        case SingInError.networkRequestFailed:
          errorMessage = "No hay conexion a internet";
          break;
        case SingInError.userDisabled:
          errorMessage = "Usuario inhabilitado";
          break;
        case SingInError.userNotFound:
          errorMessage = "El usuario no existe";
          break;
        case SingInError.wrongPassword:
          errorMessage = "Contraseña incorrecta";
          break;
        case SingInError.tooManyRequest:
          errorMessage = "Demasiados intentos";
          break;
        case SingInError.unknown:
        default:
          errorMessage = "Error desconocido";
          break;
      }
      Dialogs.alert(
        context,
        title: "Error",
        content: errorMessage,
      );
    } else {
      router.pushReplacementNamed(Routes.HOME);
    }
  }
}
