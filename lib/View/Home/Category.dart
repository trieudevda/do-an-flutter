import 'package:flutter/material.dart';
import '../../Widget/LayoutSinglePage.dart';
import '../../Widget/WidgetAll.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_flutter/Model/const_model.dart';
import '../Product/Detail/productDetail.dart';
import 'package:intl/intl.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Future<QuerySnapshot<Map<String, dynamic>>> getCategoryProduct() async {
    final data = await FirebaseFirestore.instance
        .collection('Products')
        .where('idCategoryProduct', isEqualTo: 'Rfc2JQk0GRtACosc8s5a')
        .get();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidgetSinglePage(
      page: Container(
        child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: getCategoryProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final products = snapshot.data!.docs;
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
                  childAspectRatio: (150 / 230),
                  children: [
                    for (int i = 0; i < products.length; i++)
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
                          margin: EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {},
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
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Column(
                                  children: [
                                    (products[i]['promotionPrice'] == 0)
                                        ? Text(
                                      'Giá: ${NumberFormat.currency(locale: 'vi').format(products[i]['price'])}',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                        : Column(
                                      children: [
                                        Text(
                                          'Giá gốc: ${NumberFormat.currency(locale: 'vi').format(products[i]['price'])}',
                                          style: TextStyle(
                                            decoration:
                                            TextDecoration.lineThrough,
                                            color: Colors.black38,
                                            fontSize: 13,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Giá KM: ${NumberFormat.currency(locale: 'vi').format(products[i]['promotionPrice']).toString()}',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Loại: ${products[i]['idCategoryProduct']}',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}