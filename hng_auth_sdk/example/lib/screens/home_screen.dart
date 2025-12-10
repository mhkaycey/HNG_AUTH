import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hng_auth_sdk/headless/auth_sdk_headless.dart'
    hide authServiceProvider;

import '../main.dart';
import 'splash_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    final authService = ref.read(authServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await authService.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => SplashScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: authState.user?.photoUrl != null
                          ? NetworkImage(authState.user!.photoUrl!)
                          : null,
                      child: authState.user?.photoUrl == null
                          ? Icon(Icons.person, size: 40)
                          : null,
                    ),
                    SizedBox(height: 16),
                    Text(
                      authState.user?.displayName ?? 'User',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 8),
                    Text(
                      authState.user?.email ?? '',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      children: [
                        Chip(
                          label: Text(
                            authState.state.toString().split('.').last,
                          ),
                          backgroundColor: Colors.green.shade100,
                        ),
                        if (authState.user?.emailVerified == true)
                          Chip(
                            label: Text('Verified'),
                            backgroundColor: Colors.blue.shade100,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Authentication Providers',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            ...authState.user?.providerIds.map((provider) {
                  return ListTile(
                    leading: Icon(Icons.check_circle, color: Colors.green),
                    title: Text(provider),
                  );
                }) ??
                [],
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                await authService.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => SplashScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
