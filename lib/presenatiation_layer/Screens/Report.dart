import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int _counter = 0;
  TextEditingController emailController = TextEditingController();
  GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Material(
          elevation: 10,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 208, 206, 199),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
        ),
      ]),
    );
  }
}
