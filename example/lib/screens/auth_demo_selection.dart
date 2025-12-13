import 'package:flutter/material.dart';
import 'custom_ui_demo.dart';
import 'config_demo.dart';

class AuthDemoSelection extends StatelessWidget {
  const AuthDemoSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose Demo Mode')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.apps, size: 80, color: Theme.of(context).primaryColor),
            SizedBox(height: 32),
            Text(
              'Select Authentication Mode',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48),

            // Default UI Mode Card
            // Card(
            //   elevation: 4,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (_) => DefaultUIDemo()),
            //       );
            //     },
            //     child: Padding(
            //       padding: EdgeInsets.all(24),
            //       child: Column(
            //         children: [
            //           Icon(Icons.dashboard, size: 48, color: Colors.blue),
            //           SizedBox(height: 16),
            //           Text(
            //             'Default UI Mode',
            //             style: TextStyle(
            //               fontSize: 18,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           SizedBox(height: 8),
            //           Text(
            //             'Pre-built authentication widget with all providers',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(color: Colors.grey[600]),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: 16),

            // Custom UI Mode Card
            Card(
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CustomUIDemo()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(Icons.brush, size: 48, color: Colors.purple),
                      SizedBox(height: 16),
                      Text(
                        'Headless Mode',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Custom UI with SDK authentication logic',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Provider Configuration Demo Card
            Card(
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ConfigDemo()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Icon(Icons.settings, size: 48, color: Colors.green),
                      SizedBox(height: 16),
                      Text(
                        'Provider Configuration',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Test different provider combinations',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
