import 'package:firebase_auth/firebase_auth.dart';

class SingInResponse {
  final SingInError? error;
  final User? user;

  SingInResponse(this.error, this.user);
}

enum SingInError {
  networkRequestFailed,
  userDisabled,
  userNotFound,
  wrongPassword,
  tooManyRequest,
  unknown,
}

SingInError stringToSingInError(String text) {
  print(text);
  switch (text) {
    case "user-disabled":
      return SingInError.userDisabled;
    case "user-not-found":
      return SingInError.userNotFound;
    case "network-request-failed":
      return SingInError.networkRequestFailed;
    case "wrong-password":
      return SingInError.wrongPassword;
    case "too-many-request":
      return SingInError.tooManyRequest;
    default:
      return SingInError.unknown;
  }
}
