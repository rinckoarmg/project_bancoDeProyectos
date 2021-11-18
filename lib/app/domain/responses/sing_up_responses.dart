import 'package:firebase_auth/firebase_auth.dart';

class SingUpResponse {
  final SingUpError? error;
  final User? user;

  SingUpResponse(this.error, this.user);
}

parseStringToSingUpError(String text) {
  switch (text) {
    case "email-already-in-use":
      return SingUpError.emailAlreadyInUse;
    case "network-request-failed":
      return SingUpError.networkRequestFailed;

    case "weak-Password":
      return SingUpError.weakPassword;
    default:
      return SingUpError.unKnown;
  }
}

enum SingUpError {
  networkRequestFailed,
  emailAlreadyInUse,
  weakPassword,
  unKnown,
}
