import 'package:flutter/material.dart';
import 'package:salesapp251/presenatiation_layer/Screens/FormPage.dart';
import 'package:salesapp251/presenatiation_layer/Screens/Report.dart';
import 'package:salesapp251/presenatiation_layer/Screens/homepage.dart';
import 'package:salesapp251/presenatiation_layer/location.dart';

import '../../functions/methods.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.email});
  final String? email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    determinePosition();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Space251"),
          centerTitle: true,
        ),
        body: currentIndex == 0
            ? FrontPage(email: widget.email!)
            : const Report(),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            currentIndex: currentIndex,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "History",
                icon: Icon(Icons.history),
              ),
            ],
            onTap: (int value) {
              currentIndex = value;
              setState(() {});
            }),
      ),
    );
  }
}
