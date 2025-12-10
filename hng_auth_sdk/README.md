## 🚀 Usage Examples

### **Example 1: Default UI Mode**

```dart
import 'package:firebase_auth_sdk/firebase_auth_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthWidget(
        config: AuthConfig(
          providers: AuthProviderConfig(
            emailPassword: true,
            google: true,
            apple: true,
          ),
          uiMode: AuthUIMode.defaultUI,
        ),
        onSuccess: () {
          // Navigate to home screen
        },
        onError: (error) {
          // Show error message
        },
      ),
    );
  }
}
```

### **Example 2: Headless/Custom UI Mode**

```dart
import 'package:firebase_auth_sdk/headless/auth_sdk_headless.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomLoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: Column(
        children: [
          // Your custom UI
          ElevatedButton(
            onPressed: () async {
              try {
                await authService.signInWithGoogle();
              } on InvalidCredentialsException catch (e) {
                // Handle specific error
              } on NetworkException catch (e) {
                // Handle network error
              }
            },
            child: Text('Sign in with Google'),
          ),

          // Display auth state
          Text('State: ${authState.state}'),
          if (authState.user != null)
            Text('User: ${authState.user!.email}'),
        ],
      ),
    );
  }
}
```
