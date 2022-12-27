import 'package:flutter/material.dart';
import 'package:salesapp251/presenatiation_layer/Screens/FormPage.dart';
import 'package:salesapp251/presenatiation_layer/Screens/Report.dart';
import 'package:salesapp251/presenatiation_layer/Screens/homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: currentIndex == 0
            ? Container()
            : currentIndex == 1
                ? const FormPage()
                : const Report(title: ''),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: Colors.transparent,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Info",
                icon: Icon(Icons.info),
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
