import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_flutter/Model/InvoiceDetails.dart';
import 'package:do_an_flutter/Model/const_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'Products.dart';

class Invoice {
  String? id;
  String? idUser;
  double? priceTotal;
  String? message;
  // chờ thanh toán, đã thanh toán
  String? status;
  Invoice({this.id, this.idUser, this.priceTotal, this.message, this.status});
  static FirebaseFirestore connectDB(){
    return FirebaseFirestore.instance;
  }
  static FirebaseAuth connectAuth(){
    return FirebaseAuth.instance;
  }
  static Future<void> createInvoice(List<Map<String,String>> product,String? message)async{
    Map<String,dynamic> data;
    double result=0.0;
    for(var index in product){
      await connectDB().collection(productFB).doc(index['id']).get()
          .then((DocumentSnapshot documentSnapshot){
        if (documentSnapshot.exists) {
          data= documentSnapshot.data() as Map<String,dynamic>;
          double x=double.tryParse(data['price'].toString()) as double;
          result = result+x;
        } else {
          debugPrint('Không có dữ liệu');
        }
      });
    }
    await connectDB().collection(invoiceFB).add({
      "idUser":connectAuth().currentUser?.uid,
      "priceTotal":result.toString(),
      "message":message,
      "status":"Chờ thanh toán",
    })
    .then((value){
      InvoiceDetail.createInvoiceDetail(product, value.id);
    })
    .catchError((e)=>debugPrint('them hoa don that bai'));
  }
  static Future<QuerySnapshot<Map<String, dynamic>>> getInvoice() async {

    final data=await connectDB()
        .collection(invoiceFB)
        .get();
    return data;
  }
}
