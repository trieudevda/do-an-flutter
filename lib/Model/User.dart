import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../View/Auth/Login/Login.dart';
import '../Widget/Layout.dart';
import 'const_model.dart';

class User {
  String? id;
  String? imgUrl;
  String? fullName;
  String? sex;
  int? phone;
  String? email;
  String? address;
  String? username;
  String? password;
  bool? isAdmin;
  bool? status;
  User(
      {this.id,
      this.imgUrl,
      this.fullName,
      this.sex,
      this.phone,
      this.email,
      this.address,
      this.username,
      this.password,
      this.isAdmin,
      this.status});
  User.fromJson(Map<String,dynamic> json):
    imgUrl=json['imgUrl'],
    fullName=json['fullName'],
    sex=json['sex'],
    phone=json['phone'],
    email=json['email'],
    address=json['address'],
    username=json['username'],
    isAdmin=json['isAdmin'],
    status=json['status'];
  Map<String, dynamic> toJson() =>
  {
    'imgUrl':imgUrl,
    'fullName':fullName,
    'sex':sex,
    'phone':phone,
    'email':email,
    'address':address,
    'username':username,
    'isAdmin':isAdmin,
    'status':status,
  };
  static FirebaseFirestore connectDB(){
    return FirebaseFirestore.instance;
  }
  static FirebaseAuth connectAuth(){
    return FirebaseAuth.instance;
  }
  static Future<bool> createUser(String email,String password,String name,String sex,String phone,String address,context) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value){
        connectDB().collection(userFB).doc(connectAuth().currentUser?.uid).set({
          "imgUrl": 'https://png.pngtree.com/png-vector/20230120/ourmid/pngtree-beauty-logo-design-png-image_6568470.png',
          "fullName": name,
          "sex":sex,
          "phone":int.parse(phone),
          "email":email,
          "address":address,
          "username":email,
          "isAdmin":false,
          "status":true,
        }).then((value) {
          debugPrint('them profife thanh công');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LayoutWidget(title: 'Bán hàng'),
            ),
          );
        })
            .catchError((e)=>debugPrint('them profife tb'+e));
      });
      return true;
    }on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        print('Mật khẩu được cung cấp quá yếu.');
      } else if (e.code == 'email-already-in-use') {
        print('Tài khoản đã tồn tại cho email này.');
      }
    }catch (e) {
      print(e);
    }
    return false;
  }
  static Future<bool> signInUser(String email,String password,context)async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LayoutWidget(title: 'Bán hàng'),
        ),
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Không tìm thấy người dùng nào cho email này.');
      } else if (e.code == 'wrong-password') {
        print('Sai mật khẩu.');
      }
    }
    return false;
  }
  static Future<bool> editProfile(User user)async{
    try{
      await connectDB().collection(userFB).doc(connectAuth().currentUser?.uid).update({
        'fullName':user.fullName,
        'sex':user.sex,
        'phone':user.phone,
        'email':user.email,
        'address':user.address,
      }).then((value) => debugPrint('them thanh cong'))
      .catchError((e)=>debugPrint('them that bai'));
    }catch(e){
      print('loi');
      print(e);
    }
   return true;
  }
  static Future<Map<String, dynamic>> getUser() async {
    Map<String,dynamic> data={};
   await connectDB()
        .collection(userFB)
        .doc(connectAuth().currentUser?.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        data=documentSnapshot.data() as Map<String,dynamic>;
      } else {
        debugPrint('Không có dữ liệu');
      }
    }).catchError((e){
      data= {'imgUrl': '',
        'fullName': '',
        'sex': '',
        'phone': 0,
        'email': '',
        'address':'',
        'username': '',
        'isAdmin': '',
        'status': 'status',};
     debugPrint('loi: ${e.toString()}');
   });
    return data;
  }
  static Future<void> signOutUser(context)async{
    try{
      await FirebaseAuth.instance.signOut();
      Navigator.push(context, MaterialPageRoute(
          builder: (context) =>
              LoginPage()));
    }catch(e){
      debugPrint(e.toString());
    }
  }
}
