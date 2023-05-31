import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

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

  static FirebaseFirestore connectDB(){
    return FirebaseFirestore.instance;
  }
  static FirebaseAuth connectAuth(){
    return FirebaseAuth.instance;
  }
  static Future<bool> createUser(String email,String password) async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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
  static Future<bool> signInUser(String email,String password)async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
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
  static getDocument(){
    connectDB().collection(userFB).get().then((querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          // final data=docSnapshot;
          if(docSnapshot['idUser']==connectAuth().currentUser?.uid){
            debugPrint(docSnapshot.toString());
            return docSnapshot.id;
          }
          // debugPrint(docSnapshot.id);
          // connectDB().doc(docSnapshot.id).delete();
        }
      },
    ).catchError((e)=>debugPrint('get'+e));
  }
  static Future<bool> editProfile(User user)async{
    try{
      await connectDB().collection(userFB).doc(connectAuth().currentUser?.uid).set({
            'idUser':connectAuth().currentUser?.uid,
            'imgUrl': user.imgUrl,
            'fullName': user.fullName,
            'sex': user.sex,
            'phone': user.phone,
            'email': user.email,
            'address': user.address,
            'username': user.username,
            'status': true,
            'isAdmin': false,
          }).then((value) => debugPrint('them thanh công'))
              .catchError((e)=>debugPrint('them tb'+e));
    }catch(e){
      print('loi');
      print(e);
    }
   return true;
  }
  static Future<void> signOutUser()async{
    await FirebaseAuth.instance.signOut();
    print('thanh cong');
  }
}
