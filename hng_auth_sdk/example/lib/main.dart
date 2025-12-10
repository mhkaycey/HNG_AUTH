import 'package:example/screens/splash_screen.dart';
import 'package:hng_auth_sdk/hng_auth_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

// Create a simple auth service provider
final authServiceProvider = Provider((ref) {
  return AuthService(
    config: AuthConfig(
      providers: AuthProviderConfig(
        emailPassword: true,
        google: true,
        apple: true,
      ),
      uiMode: AuthUIMode.defaultUI,
      autoRefreshToken: true,
    ),
    ref: ref,
  );
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth SDK Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
