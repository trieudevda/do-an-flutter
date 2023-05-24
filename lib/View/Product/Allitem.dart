import 'package:flutter/material.dart';

import 'Detail/productDetail.dart';

class ItemsWidget extends StatelessWidget {
  List img = [
    'h1','h2','h3','h4','h5','h6','h7','h8',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      //margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color.fromARGB(255, 233, 231, 231),
      ),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: (150/195),
        children: [
          for(int i = 0;i<img.length;i++)
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProductDetails()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color.fromARGB(255, 255, 255, 255),
                  //border: Border.all(width: 1,color: Colors.grey),
                  // boxShadow: [
                  //   BoxShadow(color: Colors.grey.withOpacity(0.5),
                  //   spreadRadius: 1,
                  //   blurRadius: 5,
                  //   )
                  // ]
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){},
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset("images/${img[i]}.jpg",
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          img[i],
                          style: TextStyle(fontSize: 18),),
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '29.999.999 đ',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}