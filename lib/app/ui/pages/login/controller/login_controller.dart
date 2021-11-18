import 'package:flutter/widgets.dart' show FormState, GlobalKey;
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:movil181/app/domain/repositories/authentication_repository.dart';
import 'package:movil181/app/domain/responses/sing_in_responses.dart';

class LoginController extends SimpleNotifier {
  String _email = '';
  String _password = '';
  final _authRepository = Get.i.find<AuthenticationRepository>();

  final GlobalKey<FormState> formKey = GlobalKey();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SingInResponse> submit() {
    return _authRepository.singInWithEmailAndPassword(_email, _password);
  }
}
