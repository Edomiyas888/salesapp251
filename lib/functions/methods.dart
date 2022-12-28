import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salesapp251/enums.dart';
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

Future<List<Building>> fetchTask(String email) async {
  final fireStore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
      await fireStore.collection("sales").doc(email).collection("task").get();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> queryMap =
      queryDocumentSnapshot.docs;
  List<Map<String, dynamic>> docList = queryMap.map((e) => e.data()).toList();
  List<Building> buildingList =
      docList.map((e) => Building.fromJson(e)).toList();
      for(int i =0; i<queryMap.length; i++){
        buildingList[i].id = queryMap[i].id;
      }
  return buildingList;
}

Future<bool> uploadAccepted(
    {required String blgName,
    required String blgLocation,
    required String managerName,
    required String managerPhone,
    required String empMail}) async {
  try {
    final _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection('sales')
        .doc(empMail)
        .collection("accepted")
        .add({
      "blgName": blgName,
      "location": blgLocation,
      "managerName": managerName,
      "phoneNumber": managerPhone,
    });
    return true;
  } on SocketException catch (_) {
    return false;
  } on FirebaseException catch (_) {
    return false;
  }
}

Future<bool> uploadRejected(
    {required String blgName,
    required String blgLocation,
    required String reason,
    required String empMail}) async {
  try {
    final _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection('sales')
        .doc(empMail)
        .collection("rejected")
        .add({
      "blgName": blgName,
      "location": blgLocation,
      "remark": reason,
    });
    return true;
  } on SocketException catch (_) {
    return false;
  } on FirebaseException catch (_) {
    return false;
  }
}

Future<bool> uploadPending(
    {required String blgName,
    required String blgLocation,
    String? managerName,
    String? managerPhone,
    required String empMail}) async {
  try {
    final _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection('sales')
        .doc(empMail)
        .collection("pending")
        .add({
      "blgName": blgName,
      "location": blgLocation,
      "managerName": managerName ?? "",
      "managerPhone": managerPhone ?? ""
    });
    return true;
  } on SocketException catch (_) {
    return false;
  } on FirebaseException catch (_) {
    return false;
  }
}
Future<void> deleteTask(String email, String id)async{
  final _firestore = FirebaseFirestore.instance;
  await _firestore.collection("sales").doc(email).collection("task").doc(id).delete();
}
Future<List<Building>> fetchAccepted(String email)async{
  final fireStore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
      await fireStore.collection("sales").doc(email).collection("accepted").get();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> queryMap =
      queryDocumentSnapshot.docs;
  List<Map<String, dynamic>> docList = queryMap.map((e) => e.data()).toList();
  List<Building> buildingList =
      docList.map((e) => Building.fromJson(e)).toList();
  return buildingList;
}
Future<List<Building>> fetchRejected(String email)async{
  final fireStore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
      await fireStore.collection("sales").doc(email).collection("rejected").get();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> queryMap =
      queryDocumentSnapshot.docs;
  List<Map<String, dynamic>> docList = queryMap.map((e) => e.data()).toList();
  List<Building> buildingList =
      docList.map((e) => Building.fromJson(e)).toList();
  return buildingList;
}
Future<List<Building>> fetchPending(String email)async{
  final fireStore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
      await fireStore.collection("sales").doc(email).collection("pending").get();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> queryMap =
      queryDocumentSnapshot.docs;
  List<Map<String, dynamic>> docList = queryMap.map((e) => e.data()).toList();
  List<Building> buildingList =
      docList.map((e) => Building.fromJson(e)).toList();
  return buildingList;
}
