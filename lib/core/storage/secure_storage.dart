import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// This provider gives access to a secure storage instance 
// Dùng để lưu trữ thông tin nhạy cảm như credentials một cách an toàn vào bộ nhớ thiết bị không phải client-side storage thông thường.
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  return storage;
});

class CredentialsStorage {
  static const _kUsername = 'cred_username';
  static const _kPassword = 'cred_password';

  final FlutterSecureStorage storage;
  CredentialsStorage(this.storage);

  Future<void> save(String username, String password) async {
    await storage.write(key: _kUsername, value: username);
    await storage.write(key: _kPassword, value: password);
  }

  Future<({String? username, String? password})> read() async {
    final u = await storage.read(key: _kUsername);
    final p = await storage.read(key: _kPassword);
    return (username: u, password: p);
  }

  Future<void> clear() async {
    await storage.delete(key: _kUsername);
    await storage.delete(key: _kPassword);
  }
}

final credentialsStorageProvider = Provider<CredentialsStorage>((ref) {
  final s = ref.watch(secureStorageProvider);
  return CredentialsStorage(s);
});


