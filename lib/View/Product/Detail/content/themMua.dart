import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemMua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 66,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.cart_badge_plus,
              color: Colors.white,
              size: 24,
            ),
            label: Text(
              "Thêm vào giỏ hàng",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ), //label text
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 68, 255, 183),
                fixedSize: Size(140, 65)),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Mua ngay",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 215, 40, 40),
                fixedSize: Size(140, 65)),
          ),
        ],
      ),
    );
  }
}
