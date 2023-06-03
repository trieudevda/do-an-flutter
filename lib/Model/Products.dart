import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'const_model.dart';

class Product {
  String? id;
  String? idCategoryProduct;
  String? name;
  String? imgUrl;
  int? price;
  int? promotionPrice;
  String? description;
  bool? status;
  Product(
      {this.id,
      this.idCategoryProduct,
      this.name,
      this.imgUrl,
      this.price,
      this.promotionPrice,
      this.description,
      this.status});
  static FirebaseFirestore connectDB(){
    return FirebaseFirestore.instance;
  }
  static Future<bool> createProduct()async{
    try{
      // get data
      final dataload=await rootBundle.loadString('json/products.json');
      // read data
      List<dynamic> dataread=json.decode(dataload);
      dataread.forEach((element) async {
        // debugPrint(element['name']);
        await connectDB().collection(productFB).doc().set({
          "idCategoryProduct":element['idCategoryProduct'],
          "name":element['name'],
          "imgUrl":element['imgUrl'],
          "price":element['price'],
          "promotionPrice":element['promotionPrice'],
          "description":element['description'],
          "status":element['status'],
        }).then((value) => debugPrint('them thanh công'))
            .catchError((e)=>debugPrint('them tb'+e));
      });
      return true;
    }catch(e){
      debugPrint("createProduct: ${e}");
    }
    return false;
  }
  static Future<Map<String, dynamic>> getProduct(String id) async {
    Map<String,dynamic> data={};
    await connectDB()
        .collection(userFB)
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        data=documentSnapshot.data() as Map<String,dynamic>;
        debugPrint(data.toString());
      } else {
        debugPrint('Không có dữ liệu');
      }
    }).catchError((e){
      debugPrint('loi: ${e.toString()}');
    });
    return data;
  }
}
