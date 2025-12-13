import 'package:flutter/material.dart';
// import 'package:hng_auth_sdk/hng_auth_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hng_auth_sdk/hng_auth_sdk.dart';
import '../screens/home_screen.dart';

class ConfigDemo extends StatelessWidget {
  const ConfigDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth Provider Configuration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select which authentication providers to enable:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Email/Password only
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderScope(
                      child: Scaffold(
                        body: AuthWidget(
                          config: AuthConfigBuilder.emailOnly(),
                          onSuccess: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Email/Password Only'),
            ),

            const SizedBox(height: 12),

            // Google only
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderScope(
                      child: Scaffold(
                        body: AuthWidget(
                          config: AuthConfigBuilder.googleOnly(),
                          onSuccess: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Google Only'),
            ),

            const SizedBox(height: 12),

            // Apple only
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderScope(
                      child: Scaffold(
                        body: AuthWidget(
                          config: AuthConfigBuilder.appleOnly(),
                          onSuccess: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Apple Only'),
            ),

            const SizedBox(height: 12),

            // Email + Google
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderScope(
                      child: Scaffold(
                        body: AuthWidget(
                          config: AuthConfigBuilder.emailAndGoogle(),
                          onSuccess: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Email + Google'),
            ),

            const SizedBox(height: 12),

            // All providers
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderScope(
                      child: Scaffold(
                        body: AuthWidget(
                          config: AuthConfigBuilder.allProviders(),
                          onSuccess: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('All Providers'),
            ),

            const SizedBox(height: 32),

            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Configuration Example:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Using AuthConfigBuilder (Recommended):\n'
                      'AuthConfigBuilder.emailOnly()\n'
                      '\n'
                      'Or manual configuration:\n'
                      'AuthConfig(\n'
                      '  providers: AuthProviderConfig(\n'
                      '    emailPassword: true,  // Enable email/password\n'
                      '    google: false,        // Disable Google\n'
                      '    apple: false,         // Disable Apple\n'
                      '  ),\n'
                      ')',
                      style: TextStyle(fontFamily: 'monospace', fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
