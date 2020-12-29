import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String savedUsername = '';
  String savedPassword = '';

  _savedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', usernameController.text);
    prefs.setString('password', passwordController.text);
  }

  _getValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //state management -> tukar state sesuatu object/widget dan refresh skrin
    // setState(() {
      // usernameController.text = prefs.getString('username');
      // passwordController.text = prefs.getString('password');
      savedUsername = prefs.getString('username');
      savedPassword = prefs.getString('password');
    // });

    if (savedUsername == 'kamilia' &&
        savedPassword == 'kamilia') {
      Navigator.pushNamed(context, 'home');
      print('login berjaya');
    } else {
      Navigator.pushNamed(context, 'error');
      print('login tak berjaya');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Text('Username: '),
                TextField(controller: usernameController),
                Text('Password: '),
                TextField(controller: passwordController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                        child: Text('Register'),
                        onPressed: () => _savedValues()),
                    SizedBox(
                      width: 10,
                    ),
                    RaisedButton(
                        child: Text('Login'), onPressed: () => _getValues()),
                  ],
                ),
                Text(usernameController.text),
                Text(passwordController.text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
