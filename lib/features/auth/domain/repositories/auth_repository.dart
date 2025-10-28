import 'package:dio/dio.dart';
import 'package:flutter_application_the_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login({required String username, required String password});
}

class AuthRepositoryImpl implements AuthRepository {
  final Dio dio;
  AuthRepositoryImpl(this.dio);

  @override
  Future<User> login({required String username, required String password}) async {
    final response = await dio.post('/api/login', data: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      return User(
        username: (data['username'] ?? '') as String,
        token: (data['token'] ?? '') as String,
      );
    }

    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: response.data,
    );
  }
}


