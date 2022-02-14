import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 200, left: 30),
        color: Colors.black,
        child: Image.asset(
          'assets/images/logo_2.png',
        ),
      ),
    );
  }
}
