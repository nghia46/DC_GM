

import 'package:flutter_application_the_app/features/auth/domain/entities/user.dart';
import 'package:flutter_application_the_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  const LoginUseCase(this.repository);

  Future<User> call({required String username, required String password}) {
    return repository.login(username: username, password: password);
  }
}


