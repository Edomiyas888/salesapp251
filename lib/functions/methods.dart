import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadForm()async{
  final fireStore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = await fireStore.collection("sales").get();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> queryMap = queryDocumentSnapshot.docs;
  List<Map<String, dynamic>> docList = queryMap.map((e) => e.data()).toList();
}