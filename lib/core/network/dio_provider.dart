import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Không cần mock attendance & track nữa => xoá
// final List<Map<String, dynamic>> _mockAttendance = <Map<String, dynamic>>[];
// final List<Map<String, dynamic>> _mockTracks = <Map<String, dynamic>>[];

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://mock.local',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Mock API: POST /api/login
        if (options.method.toUpperCase() == 'POST' && options.path == '/api/login') {
          await Future<void>.delayed(const Duration(milliseconds: 600));

          final data = options.data is Map<String, dynamic>
              ? options.data as Map<String, dynamic>
              : <String, dynamic>{};

          final username = data['username']?.toString() ?? '';
          final password = data['password']?.toString() ?? '';

          if (username == 'admin' && password == '123456') {
            return handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 200,
                data: {
                  'token': 'mock-token-123',
                  'username': username,
                },
              ),
            );
          } else {
            return handler.resolve(
              Response(
                requestOptions: options,
                statusCode: 401,
                data: {
                  'message': 'Sai tài khoản hoặc mật khẩu',
                },
              ),
            );
          }
        }

        // Không xử lý gì khác
        handler.next(options);
      },
    ),
  );

  // ❌ BỎ HOÀN TOÀN GỬI GPS NỀN
  // ❌ BỎ CHẤM CÔNG
  // ❌ BỎ TRACKING

  return dio;
});
