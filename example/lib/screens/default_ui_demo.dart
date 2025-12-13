import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hng_auth_sdk/hng_auth_sdk.dart';

class DefaultUIDemo extends StatelessWidget {
  const DefaultUIDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Default UI Demo')),
      body: AuthWidget(
        config: AuthConfig(
          providers: AuthProviderConfig(
            emailPassword: true,
            google: true,
            apple: true,
          ),
          uiMode: AuthUIMode.defaultUI,
        ),
        onSuccess: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          );
        },
        onError: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      ),
    );
  }
}
