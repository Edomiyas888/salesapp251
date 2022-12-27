import 'package:firebase_auth/firebase_auth.dart';

Future<String?> signin(String email, String password) async {
  final _auth = FirebaseAuth.instance;
  UserCredential credential =
      await _auth.signInWithEmailAndPassword(email: email, password: password);
  if (credential.user != null) {
    return credential.user!.email!;
  }
  return null;
}
