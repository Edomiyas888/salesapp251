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

Future<List<Building>> fetchTask() async {
  final _auth = FirebaseAuth.instance;
  String? email = _auth.currentUser?.email;
  if(email!=null){
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
  return [];
}

Future<bool> uploadAccepted(
    {required String blgName,
    required String blgLocation,
    required String managerName,
    required String managerPhone}) async {
  try {
    final _auth = FirebaseAuth.instance;
  String? email = _auth.currentUser?.email;
  if(email!=null){
    final _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection('sales')
        .doc(email)
        .collection("accepted")
        .add({
      "blgName": blgName,
      "location": blgLocation,
      "managerName": managerName,
      "phoneNumber": managerPhone,
    });
    return true;
  }
  return false;
  } on SocketException catch (_) {
    return false;
  } on FirebaseException catch (_) {
    return false;
  }
}

Future<bool> uploadRejected(
    {required String blgName,
    required String blgLocation,
    required String reason}) async {
  try {
    final _auth = FirebaseAuth.instance;
  String? email = _auth.currentUser?.email;
  if(email!=null){
    final _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection('sales')
        .doc(email)
        .collection("rejected")
        .add({
      "blgName": blgName,
      "location": blgLocation,
      "remark": reason,
    });
    return true;
  }
  return false;
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
    String? managerPhone}) async {
  try {
    final _auth = FirebaseAuth.instance;
  String? email = _auth.currentUser?.email;
  if(email!=null){
    final _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection('sales')
        .doc(email)
        .collection("pending")
        .add({
      "blgName": blgName,
      "location": blgLocation,
      "managerName": managerName ?? "",
      "managerPhone": managerPhone ?? ""
    });
    return true;
  }
  return false;
  } on SocketException catch (_) {
    return false;
  } on FirebaseException catch (_) {
    return false;
  }
}
Future<void> deleteTask(String id)async{
  final _auth = FirebaseAuth.instance;
  String? email = _auth.currentUser?.email;
  if(email!=null){
      final _firestore = FirebaseFirestore.instance;
  await _firestore.collection("sales").doc(email).collection("task").doc(id).delete();
  }
}
Future<List<Building>> fetchAccepted()async{
  final _auth = FirebaseAuth.instance;
  String? email = _auth.currentUser?.email;
  if(email!=null){
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
  return [];
}
Future<List<Building>> fetchRejected()async{
  final _auth = FirebaseAuth.instance;
  String? email = _auth.currentUser?.email;
  if(email!=null){
    final fireStore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
      await fireStore.collection("sales").doc(email).collection("rejected").get();
  List<QueryDocumentSnapshot<Map<String, dynamic>>> queryMap =
      queryDocumentSnapshot.docs;
  List<Map<String, dynamic>> docList = queryMap.map((e) => e.data()).toList();
  List<Building> buildingList =
      docList.map((e) => Building.fromJson(e)).toList();
      print(buildingList);
  return buildingList;
  }
  return [];
}
Future<List<Building>> fetchPending()async{
  final _auth = FirebaseAuth.instance;
  String? email = _auth.currentUser?.email;
  if(email!=null){
    final fireStore = FirebaseFirestore.instance;
  QuerySnapshot<Map<String, dynamic>> queryDocumentSnapshot =
      await fireStore.collection("sales").doc(email).collection("pending").get();
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
  return [];
}
Future<bool> updatePending(String id, String? managerName, String? managerPhone, String? reason, UploadType uploadType)async{
  try{
    final _auth = FirebaseAuth.instance;
  String? email = _auth.currentUser?.email;
  if(email!=null){
    final fireStore = FirebaseFirestore.instance;
  DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
      await fireStore.collection("sales").doc(email).collection("pending").doc(id).get();
  Map<String, dynamic>? queryMap =
      documentSnapshot.data();
      String directory = uploadType == UploadType.accepted? "accepted": "rejected";
      await fireStore.collection("sales").doc(email).collection(directory).add(directory=="rejected"? {
        "blgName": queryMap!["blgName"],
        "location": queryMap["location"],
        "remark": reason,
      } :{
        "blgName": queryMap!["blgName"],
        "location": queryMap["location"],
        "managerName": managerName,
        "managerPhone": managerPhone
      });
      await fireStore.collection("sales").doc(email).collection("pending").doc(id).delete();
      return true;
  }
  return false;
  }on SocketException catch(_){
    return false;
  }on FirebaseException catch(_){
    return false;
  }
}