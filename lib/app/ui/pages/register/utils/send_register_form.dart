import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:movil181/app/domain/responses/sing_up_responses.dart';
import 'package:movil181/app/ui/routes/routes.dart';
import 'package:movil181/app/ui/widgets/dialogs/dialogs.dart';
import 'package:movil181/app/ui/widgets/dialogs/progress_dialog.dart';

import '../register_page.dart' show registerProvider;

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;

  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    //Navigator.pop(context);
    if (response.error != null) {
      print(response.error);
      late String content;

      switch (response.error) {
        case SingUpError.emailAlreadyInUse:
          content = "El email ya se encuentra registrado";
          break;
        case SingUpError.weakPassword:
          content = "La contraseña es muy debil";
          break;
        case SingUpError.unKnown:
          content = "No se pudo crear el usuario";
          break;
        case SingUpError.networkRequestFailed:
          content = "No hay conexion a internet";
          break;
      }

      Dialogs.alert(
        context,
        title: "ERROR",
        content: content,
      );
    } else {
      router.pushNamedAndRemoveUntil(Routes.HOME);
    }
  } else {
    Dialogs.alert(
      context,
      title: "Error",
      content: "Campos invalidos",
    );
  }
}
