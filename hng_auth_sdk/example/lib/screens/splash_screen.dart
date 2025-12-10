import 'package:example/screens/auth_demo_selection.dart';
import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hng_auth_sdk/hng_auth_sdk.dart';

class SplashScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    // Listen to auth state changes
    ref.listen(authStateProvider, (previous, next) {
      if (next.state == AuthState.authenticated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: authState.state == AuthState.authenticated
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Firebase Auth SDK',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Demo Application',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 48),
                  if (authState.state == AuthState.unauthenticated)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AuthDemoSelection(),
                            ),
                          );
                        },
                        child: Text('Get Started'),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
