import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_flutter/Model/Products.dart';
import 'package:do_an_flutter/Model/const_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import 'Detail/productDetail.dart';

class saleWidget extends StatelessWidget {
  Future<QuerySnapshot<Map<String, dynamic>>> getProducts() async {
    final data = await FirebaseFirestore.instance
        .collection(productFB)
        .get();
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
      future: getProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data!.docs;
          final filteredProducts = products.where((product) {
            final promotionPrice = product['promotionPrice'].toString();
            return promotionPrice.isNotEmpty && int.parse(promotionPrice) > 0;
          }).toList();
          final displayedProducts = filteredProducts.length > 1
              ? filteredProducts.sublist(0,15) : filteredProducts;
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: const Color.fromARGB(255, 233, 231, 231),
            ),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: (150 / 215),
              children: [
                for (int i = 0; i < displayedProducts.length; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                       child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: Column(
                                children: [
                                    Text('Sale', style: TextStyle(fontSize: 10, color: Colors.red),),
                                ],
                              )
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProductDetails()),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Image.network(
                                products[i]['imgUrl'],
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  products[i]['name'],
                                  style: TextStyle(fontSize: 18,),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ),
                          Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    '${NumberFormat.currency(locale: 'vi').format(displayedProducts[i]['price'])}',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black38,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(
                                    '${NumberFormat.currency(locale: 'vi').format(displayedProducts[i]['promotionPrice']).toString()}',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                          Row(
                            children: [
                              if(products[i]['idCategoryProduct'] == 'fbyCDaL0ApIF89TrLHnC')
                                Container(
                                  child: Text(
                                    'Loại: Điện thoại',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                if(products[i]['idCategoryProduct'] == '9K6Q38nm0zINxeaGLuqW')
                                  Container(
                                    child: Text(
                                      'Loại: Laptop',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  if(products[i]['idCategoryProduct'] == 'Rfc2JQk0GRtACosc8s5a')
                                  Container(
                                    child: Text(
                                      'Loại: Máy Tính Bảng',
                                      style: TextStyle(fontSize: 10), textAlign: TextAlign.justify,
                                    ),
                                  ),
                              
                            ],
                          ),

                        ],
                      ),
                      // child: Column(
                      //   children: [
                      //     InkWell(
                      //       onTap: () {},
                      //       child: Container(
                      //         margin: EdgeInsets.all(5),
                      //         child: Image.network(
                      //           products[i]['imgUrl'],
                      //           width: 100,
                      //           height: 100,
                      //           fit: BoxFit.contain,
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(bottom: 2),
                      //       child: Container(
                      //         alignment: Alignment.centerLeft,
                      //         child: Text(
                      //           products[i]['name'],
                      //           style: TextStyle(fontSize: 14),
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(bottom: 2),
                      //       child: Column(
                      //         children: [
                      //           (products[i]['promotionPrice'] == 0)
                      //             ? Text(
                      //               '${products[i]['price']} đ',
                      //               style: TextStyle(
                      //                 fontSize: 13,
                      //                 fontWeight: FontWeight.bold,
                      //               ),
                      //             )
                      //               : Column(
                      //             children: [
                      //               Text(
                      //                 '${products[i]['price']} đ',
                      //                 style: TextStyle(
                      //                   decoration:
                      //                   TextDecoration.lineThrough,
                      //                   color: Colors.black38,
                      //                   fontSize: 13,
                      //                 ),
                      //               ),
                      //               Text(
                      //                 'Giá KM: ${products[i]['promotionPrice'].toString()} đ',
                      //                 style: TextStyle(
                      //                   color: Colors.red,
                      //                   fontSize: 13,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  )
              ],
            ),
          );
        }
        else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
