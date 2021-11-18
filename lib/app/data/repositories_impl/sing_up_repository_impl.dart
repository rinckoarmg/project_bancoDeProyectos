import 'package:firebase_auth/firebase_auth.dart';
import 'package:movil181/app/domain/repositories/sing_up_repository.dart';
import 'package:movil181/app/domain/responses/sing_up_responses.dart';
import 'package:movil181/app/domain/use_cases/sing_up.dart';

class SingUpRepositoryImpl implements SignUpRepository {
  final FirebaseAuth _auth;

  SingUpRepositoryImpl(this._auth);

  @override
  Future<SingUpResponse> register(SingUpData data) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: data.email, password: data.password);
      await userCredential.user!.updateDisplayName(
        "${data.name}",
      );
      return SingUpResponse(null, userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return SingUpResponse(parseStringToSingUpError(e.code), null);
    }
  }
}
