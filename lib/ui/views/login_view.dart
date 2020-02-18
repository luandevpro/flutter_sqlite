import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  final String data;
  LoginView({Key key, this.data}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Login View ${widget.data}')));
  }
}
