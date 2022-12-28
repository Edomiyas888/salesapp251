import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  TextEditingController emailController = TextEditingController();
  GlobalKey _key = GlobalKey();

  var bottomNavigationBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 208, 206, 199),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Building Name',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sans-serif',
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Location',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sans-serif',
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 75,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/yes.png'))),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 208, 206, 199),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Building Name',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sans-serif',
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Location',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sans-serif',
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 75,
                    height: 50,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/no.png'))),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 208, 206, 199),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Building Name',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sans-serif',
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Location',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sans-serif',
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 75,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('../xxc/Image/yes.png'))),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 208, 206, 199),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Building Name',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sans-serif',
                              fontSize: 25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Location',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'sans-serif',
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 75,
                    height: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('../xxc/Image/yes.png'))),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
