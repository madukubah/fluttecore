import 'package:flutter/material.dart';
import 'activity/splash/SplashScreen.dart';
import 'activity/main/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutteCore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Home(  )
      },
      onGenerateRoute : (settings) {
        
      }
    );
  }
}
