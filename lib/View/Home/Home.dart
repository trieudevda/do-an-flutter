import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_flutter/Model/const_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:do_an_flutter/View/Home/Widget/Slide.dart';
import '../Product/SaleItem.dart';
import 'Widget/DiscountProductGrid.dart';
import 'Widget/NewProductGrid.dart';
import 'Widget/RecommendProductGrid.dart';
import 'package:do_an_flutter/View/Home/Category.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../Widget/WidgetAll.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<DocumentSnapshot<Map<String,dynamic>>> getProducts()async{
    final data=await FirebaseFirestore.instance.collection(productFB).doc().get();
    return data;
  }
  @override
  Widget build(BuildContext context) {
    getProducts();
    debugPrint(getProducts().toString());
    return Container(
      child: ListView(
        children: [
          const Slide(),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            margin: const EdgeInsets.only(top: 5),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Category()),
                                );
                              },
                              child: Image.network(
                                "https://cdn-icons-png.flaticon.com/512/1985/1985069.png",
                                width: 40,
                              ),
                            ),
                            Text('Smart Phone'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Category()),
                                );
                              },
                              child: Image.network(
                                "https://cdn-icons-png.flaticon.com/512/2482/2482264.png",
                                width: 40,
                              ),
                            ),
                            Text('Laptop'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                        },
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Category()),
                                );
                              },
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNZ1vt9mSYPEq-T-T25huFaSkoOVlTxh24koyTNEga0CX4fyP7rz1dc5ltxdlUBWOMaG4&usqp=CAU",
                                width: 40,
                              ),
                            ),
                            Text('Tablet'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            child: Text('Sản Phẩm Mới Nhất',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold)
            ),
          ),
          Container(
            child: NewProductGrid(),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            margin: EdgeInsets.all(0),
            color: Color.fromARGB(255, 232, 230, 230),
            alignment: Alignment.topRight,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => saleWidget()),
                    );
                  },
                  child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      child: Text(
                        'Xem thêm',
                        style: TextStyle(color: Colors.redAccent, decoration: TextDecoration.underline,),
                      )
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            // color: Colors.white,
            child: Text('Đang Khuyến Mãi',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.redAccent, fontSize: 20, fontWeight: FontWeight.bold)
            ),
          ),
          Container(
            child: DiscountProductGrid(),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            margin: EdgeInsets.all(0),
            color: Color.fromARGB(255, 232, 230, 230),
            alignment: Alignment.topRight,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => saleWidget()),
                    );
                  },
                  child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      child: Text(
                        'Xem thêm',
                        style: TextStyle(color: Colors.redAccent, decoration: TextDecoration.underline,),
                      )
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            child: Container(
              child: Text('Có thể bạn cũng thích',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.redAccent, fontSize: 20,fontWeight: FontWeight.bold)
              ),
            ),
          ),
          Container(
            child: RecommendProductGrid(),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            margin: EdgeInsets.all(0),
            color: Color.fromARGB(255, 232, 230, 230),
            alignment: Alignment.topRight,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => saleWidget()),
                    );
                  },
                  child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(15),
                      child: Text(
                        'Xem thêm',
                        style: TextStyle(color: Colors.redAccent, decoration: TextDecoration.underline,),
                      )
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
