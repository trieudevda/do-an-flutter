import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'const_model.dart';

class CategoryProduct {
  int? id;
  String? name;
  bool? status;
  CategoryProduct({this.id, this.name, this.status});
  factory CategoryProduct.fromJson(Map<String,dynamic> json){
    return CategoryProduct(
      name: json['name'],
      status: json['status']
    );
  }
  static FirebaseFirestore connectDB(){
    return FirebaseFirestore.instance;
  }
  static Future<bool> createCategoryProduct()async{
    try{
      // get data
      final dataload=await rootBundle.loadString('json/category_product.json');
      // read data
      List<dynamic> dataread=json.decode(dataload);
      dataread.forEach((element) async {
        // CategoryProduct dataread1=CategoryProduct.fromJson(element);
        await connectDB().collection(cateProductFB).doc().set({
          "name":element['name'],
          "status":element['status'],
        }).then((value) => debugPrint('them thanh công'))
            .catchError((e)=>debugPrint('them tb'+e));
      });
      return true;
    }catch(e){
      debugPrint("createCategoryProduct: ${e}");
    }
    return false;
  }
}
