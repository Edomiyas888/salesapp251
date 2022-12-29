import 'package:flutter/material.dart';
import 'package:salesapp251/enums.dart';
import 'package:salesapp251/presenatiation_layer/Screens/FormPage.dart';
import 'package:salesapp251/presenatiation_layer/Screens/Login.dart';
import 'package:salesapp251/presenatiation_layer/Screens/Report.dart';
import 'package:salesapp251/presenatiation_layer/Screens/homepage.dart';
import 'package:salesapp251/presenatiation_layer/location.dart';

import '../../functions/auth.dart';
import '../../functions/methods.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropAppBar = "Accepted";
  List<String> strList = ["Accepted", "Rejected", "Pending"];

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
          centerTitle: false,
          actions: currentIndex == 1
              ? [
                  DropdownButton<String>(
                    value: dropAppBar,
                    dropdownColor: Colors.grey,
                    icon: const Icon(Icons.arrow_downward_sharp),
                    elevation: 16,
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropAppBar = value!;
                      });
                    },
                    items:
                        strList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  ),
                ]
              : [
                  IconButton(
                    onPressed: ()async{
                      bool result = await signout();
                      print(result);
                      if(result){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const Login()), (route)=>false);
                      }
                    },
                    icon: const Icon(Icons.logout),
                  ),
                ],
        ),
        body: currentIndex == 0
            ? FrontPage()
            : Report(dropAppBar: dropAppBar),
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
