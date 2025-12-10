import 'package:flutter/material.dart';
import 'package:auth_ui/utils/route_generator.dart';


class  MyApp  extends StatelessWidget {
  const  MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modular Authentication SDK',
       debugShowCheckedModeBanner: false,
      initialRoute: RouteGenerator.initial,
      onGenerateRoute: RouteGenerator.generateRoute,
      // themeMode: ThemeMode.system,
      // theme: ThemeData(
      //   scaffoldBackgroundColor: Colors.transparent, 
      //   canvasColor: Colors.transparent,
      // ),
    );
  }
}