import 'package:movil181/app/domain/responses/sing_up_responses.dart';
import 'package:movil181/app/domain/use_cases/sing_up.dart';

abstract class SignUpRepository {
  Future<SingUpResponse> register(SingUpData data);
}
