import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _counter = 0;
  TextEditingController emailController = TextEditingController();
  GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 500,
                width: 500,
                color: Color(0xFF2196F3),
                child: Form(
                  key: _key,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 300,
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.person),
                            TextFormField(
                              controller: emailController,
                              // decoration: InputDecoration(
                              //     labelText: 'email', hintText: 'email'),
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   // ignore: prefer_const_literals_to_create_immutables
                      //   children: [
                      //     // ignore: prefer_const_constructors

                      //     Icon(Icons.lock),
                      //     TextField(
                      //       decoration: InputDecoration(
                      //           labelText: 'Password', hintText: 'Password'),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
