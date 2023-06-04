import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../Model/Products.dart';
import 'package:do_an_flutter/Model/const_model.dart';

class MoTa extends StatelessWidget {
  Future<Map<String, dynamic>> getProduct(String id) async {
    Map<String, dynamic> data = {};
    await FirebaseFirestore.instance
        .collection(productFB)
        .doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        data = documentSnapshot.data() as Map<String, dynamic>;
        debugPrint(data.toString());
      } else {
        debugPrint('Không có dữ liệu');
      }
    }).catchError((e) {
      debugPrint('loi: ${e.toString()}');
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getProduct('0mVatnv6aaNgi9975NQV'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 400,
                child: Text(
                  '${products['description']}',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
