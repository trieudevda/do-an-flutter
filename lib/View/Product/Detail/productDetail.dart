import 'package:flutter/material.dart';

import '../../../Widget/LayoutSinglePageCart.dart';
import '../Allitem.dart';
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
    return LayoutWidgetSinglePageCart(
      page: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.red),
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
  }
}
