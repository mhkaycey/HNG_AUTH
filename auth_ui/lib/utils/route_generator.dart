import 'package:flutter/material.dart';
import 'package:auth_ui/screens/login_screen.dart';
import 'package:auth_ui/screens/register_screen.dart';



class RouteGenerator {
  static const String login = '/login';
  static const String register = '/register';
   static const String initial = '/';


 static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => Login());
      case login:
        return MaterialPageRoute(builder: (_) => Login());
      case register:
          return MaterialPageRoute(builder:(_)=> Register());
      default:
        return _errorRoute();
    }
  }

  // This method is outside the generateRoute method — at class level!
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }


}