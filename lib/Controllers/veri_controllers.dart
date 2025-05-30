import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tm_stok/Models/veri.dart';

class VeriController {
  VeriController._();
  static VeriController get instance => VeriController._();
  final CollectionReference veriCollection = FirebaseFirestore.instance
      .collection('components'); // Firebase'deki koleksiyon adını buraya yazın

  Future<List<veri>> getVeriler() async {
    QuerySnapshot snapshot = await veriCollection.get();
    return snapshot.docs
        .map((doc) => veri.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> addVeri(veri yeniVeri) async {
    await veriCollection.add(yeniVeri.toJson());
  }

  Future<void> updateVeri(
      String veriID, Map<String, dynamic> updatedData) async {
    await veriCollection.doc(veriID).update(updatedData);
  }

  Future<void> deleteVeri(BuildContext context, String veriID) async {
    await veriCollection.doc(veriID).delete();
  }
}
