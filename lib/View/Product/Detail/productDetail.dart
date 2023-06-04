import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_flutter/View/Product/Detail/content/binhluan.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_flutter/Model/Products.dart';
import 'package:do_an_flutter/Model/const_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../Widget/LayoutSinglePageCart.dart';
import '../Allitem.dart';
import 'content/itemImage.dart';
import 'content/mota.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetails();
}

class _ProductDetails extends State<ProductDetails> {
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
            return LayoutWidgetSinglePageCart(
              page: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemImage(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${products['name']}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${products['promotionPrice']} VND',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.red),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${products['price']} VND',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Chi tiết sản phẩm",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  MoTa(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Bình luận",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BinhLuan(),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                      child: Text(
                    "─────────Có thể bạn cũng thích─────────",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )),
                  SizedBox(
                    height: 25,
                  ),
                  ItemsWidget(),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
