import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  // const name({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';

  getValues() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //state management -> tukar state sesuatu object/widget dan refresh skrin
    setState(() {
      username = prefs.getString('username');
    });
  }

//lifecycle hooks
  @override
  void initState() {
    super.initState();
    getValues();
      }
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: Center(
            child: Container(
              // username == null ? 0 : username.length,
              child: Text(username),
            ),
          ),
        );
      }
}
