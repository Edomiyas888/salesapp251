import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signin(String email, String password) async {
  final _auth = FirebaseAuth.instance;
  UserCredential credential =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  if (credential.user != null) {
    return true;
  }
  return false;
}
