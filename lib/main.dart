import 'package:flutter/material.dart';
import 'package:loginpage/errorpage.dart';
import 'package:loginpage/homepage.dart';
import 'package:loginpage/loginpage.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        //Nama jalan dan Jalan dia
        'login': (context) => LoginPage(),
        'home': (context) => HomePage(),
        'error': (context) => ErrorPage(),
      },
    );
  }
}