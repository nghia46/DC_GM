import 'package:flutter/material.dart';
import 'package:flutter_application_the_app/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'quan_ly_bao_ve',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        brightness: Brightness.light,
      ),

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('vi')],
      locale: const Locale('vi'),
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        // '/dashboard': (_) => const DashboardScreen(),
        // '/attendance/face': (_) => const FaceAttendanceScreen(),
        // '/attendance/history': (_) => const AttendanceHistoryScreen(),
      },
    );
  }
}
