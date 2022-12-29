import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

Future<String?> signin(String email, String password) async {
  try {
    final _auth = FirebaseAuth.instance;
    UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
        
    if (_auth.currentUser!=null) {
      return "Success!";
    }
    return null;
  } on SocketException catch (_) {
    return "No internet connection";
  } on FirebaseException catch (e) {
    return e.message;
  }
}

Future<bool> signout() async {
  try {
    final _auth = FirebaseAuth.instance;
    await _auth.signOut();
    return true;
  } on SocketException catch (_) {
    return false;
  } on FirebaseException catch (_) {
    return false;
  }
}
