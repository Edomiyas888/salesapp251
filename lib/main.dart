import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:salesapp251/presenatiation_layer/Screens/FormPage.dart';
import 'package:salesapp251/presenatiation_layer/Screens/Home.dart';
import 'package:salesapp251/presenatiation_layer/Screens/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const HomePage(),
        '/formPage': (context) => const FormPage(),
      },
    );
  }
}
