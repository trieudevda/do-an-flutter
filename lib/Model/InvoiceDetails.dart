import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_flutter/Model/Products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Invoices.dart';
import 'const_model.dart';

class InvoiceDetail {
  String? id;
  // List<Product> product;
  String? idProduct;
  String? idInvoice;
  // Invoice invoice;
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
}
