// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/TypeData.dart';

class TypeDataController {
  TypeDataController._();

  static TypeDataController get instance => TypeDataController._();
  final CollectionReference veriCollection = FirebaseFirestore.instance
      .collection('classes'); 

  Future<List<TypeData>> getTypes() async {
    QuerySnapshot snapshot = await veriCollection.get();
    return snapshot.docs
        .map((doc) => TypeData.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
