import 'package:flutter/material.dart';

import 'content/binhluan.dart';
import 'content/itemImage.dart';
import 'content/mota.dart';
import 'content/themMua.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetails();
}

class _ProductDetails extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 70)),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                    Container(
                      height: 50,
                      //width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 231, 229, 229),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.5,
                            )
                          ]),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Tìm kiếm sản phẩm",
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.search,
                              size: 30,
                            ),
                            color: Color.fromARGB(255, 186, 185, 185),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                      ),
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ItemImage(),
              SizedBox(
                height: 20,
              ),
              Text(
                'Iphone 14 Pro Max - 512GB',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '35000000 đ',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Colors.red),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '42000000 đ',
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: ThemMua(),
    );
  }
}
