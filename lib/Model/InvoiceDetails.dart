import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'const_model.dart';

class InvoiceDetail {
  String? id;
  String? idProduct;
  String? idInvoice;
  int? amount;
  bool? status;
  InvoiceDetail(
      {this.id,
      this.idProduct,
      this.idInvoice,
      this.amount,
      this.status});

  static FirebaseFirestore connectDB(){
    return FirebaseFirestore.instance;
  }
  static FirebaseAuth connectAuth(){
    return FirebaseAuth.instance;
  }
  static Future<void> createInvoiceDetail(List<Map<String,String>> product,String idInvoice)async{
    for(var index in product){
      await connectDB().collection(invoiceDetailFB).add({
        "idUser":connectAuth().currentUser?.uid,
        "idProduct":index['id'],
        "idInvoice":idInvoice,
        "amount":index['amount'],
        "status":true,
      })
      .then((value) => debugPrint('them chi tiet hoa don thanh cong'))
      .catchError((e)=>debugPrint('them chi tiet hoa don that bai'));
    }
  }
  static Future<dynamic> getInvoiceDetail(String id)async{
    List<Map<String,dynamic>> data=[];
    try{
      final x=await connectDB().collection(invoiceDetailFB).where('idInvoice',isEqualTo: id).get()
        .then((value)=>value.docs.forEach((element)async {
        await connectDB().collection(productFB).doc(element['idProduct']).get()
            .then((v){
          data.add({"amount":double.parse(element['amount']),"product":v.data()} as Map<String,dynamic>);
        });
            // data.add(json););
      }));
      debugPrint(data.toString());
      // debugPrint('data ${data.toString()}');
    }catch(e){
      debugPrint('khong co du lieu invoice detail: ${e.toString()}');
    }
  }
}
