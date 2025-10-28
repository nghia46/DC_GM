// import 'package:flutter/material.dart';
// import 'package:flutter_application_the_app/core/network/dio_provider.dart';
// import 'package:flutter_application_the_app/features/auth/domain/entities/user.dart';
// import 'package:flutter_application_the_app/features/auth/domain/repositories/auth_repository.dart';
// import 'package:flutter_application_the_app/features/auth/domain/usecases/login_use_case.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// @immutable
// class AuthState {
//   final bool isLoading;
//   final User? user;
//   final String? errorMessage;

//   const AuthState({this.isLoading = false, this.user, this.errorMessage});

//   AuthState copyWith({bool? isLoading, User? user, String? errorMessage}) {
//     return AuthState(
//       isLoading: isLoading ?? this.isLoading,
//       user: user ?? this.user,
//       errorMessage: errorMessage,
//     );
//   }
// }

// final authRepositoryProvider = Provider<AuthRepository>((ref) {
//   final dio = ref.watch(dioProvider);
//   return AuthRepositoryImpl(dio);
// });

// final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
//   final repo = ref.watch(authRepositoryProvider);
//   return LoginUseCase(repo);
// });

// class AuthController extends StateNotifier<AuthState> {
//   final LoginUseCase loginUseCase;
  
//   AuthController(this.loginUseCase) : super(const AuthState());

//   Future<bool> login(String username, String password) async {
//     state = state.copyWith(isLoading: true, errorMessage: null);
//     try {
//       final user = await loginUseCase(username: username, password: password);
//       state = state.copyWith(isLoading: false, user: user, errorMessage: null);
//       // ❌ Đã bỏ tracker, không gọi start() nữa
//       return true;
//     } catch (e) {
//       state = state.copyWith(
//         isLoading: false,
//         errorMessage: 'Sai tài khoản hoặc mật khẩu',
//       );
//       return false;
//     }
//   }

//   void logout() {
//     // ❌ Không cần tracker.stop()
//     state = const AuthState();
//   }
// }

// final authControllerProvider =
//     StateNotifierProvider<AuthController, AuthState>((ref) {
//   final usecase = ref.watch(loginUseCaseProvider);
//   return AuthController(usecase);
// });
