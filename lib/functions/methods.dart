import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salesapp251/models/buildingModel.dart';

Future<void> fetchEmployee() async {
  final fireStore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
      await fireStore.collection("sales").get();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> queryMap =
      queryDocumentSnapshot.docs;
  List<Map<String, dynamic>> docList = queryMap.map((e) => e.data()).toList();
  print(docList.first.values.first);
}
Future<List<Building>> fetchTask(String email)async{
  final fireStore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot = await fireStore.collection("sales").doc(email).collection("task").get();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> queryMap =
      queryDocumentSnapshot.docs;
      List<Map<String, dynamic>> docList = queryMap.map((e) => e.data()).toList();
      List<Building> buildingList = docList.map((e) => Building.fromJson(e)).toList();
      return buildingList;
}
