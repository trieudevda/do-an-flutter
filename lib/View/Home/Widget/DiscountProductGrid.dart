import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_flutter/Model/const_model.dart';
import '../../Product/Detail/productDetail.dart';

class DiscountProductGrid extends StatelessWidget {
  Future<QuerySnapshot<Map<String, dynamic>>> getProducts() async {
    final data = await FirebaseFirestore.instance.collection(productFB).get();
    return data;
  }

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
                for (int i = 0; i < filteredProducts.length; i++)
                  // if (double.parse(filteredProducts[i]['promotionPrice']) > 0)
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
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Image.network(
                                filteredProducts[i]['imgUrl'],
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
                                filteredProducts[i]['name'],
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Column(
                              children: [
                                Text(
                                  'Giá gốc: ${filteredProducts[i]['price']} đ',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.black38,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Giá KM: ${filteredProducts[i]['promotionPrice'].toString()} đ',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Loại: ${filteredProducts[i]['idCategoryProduct']}',
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
