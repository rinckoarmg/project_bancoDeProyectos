import 'package:firebase_auth/firebase_auth.dart';
import 'package:movil181/app/domain/responses/sing_in_responses.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;
  Future<void> signOut();
  Future<SingInResponse> singInWithEmailAndPassword(
    String email,
    String password,
  );
}
