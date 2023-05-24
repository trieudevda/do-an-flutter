import 'package:flutter/material.dart';

import '../../Product/Detail/productDetail.dart';

class OneProduct extends StatelessWidget {
  const OneProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  ProductDetails()),
        );
        // print('product demo');
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10,top: 10,left: 10,right: 10),
        margin: EdgeInsets.only(top: 5,bottom: 5,),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.black38),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              width: MediaQuery.of(context).size.width,
              child: Text('Chờ thanh toán',textAlign: TextAlign.center,style: TextStyle(color: Colors.red),),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-den-thumb-600x600.jpg',
                  width: 90,
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('iPhone 14 Pro Max',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Phân loại: Đen'),
                          Text('x1',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('24.000.000 đ',style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.black38,fontSize: 14),),
                          SizedBox(width: 10,),
                          Text('22.000.000 đ',style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.black38,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('1 sản phẩm',style: TextStyle(color: Colors.black38),),
                Row(
                  children: [
                    Text('Tổng thanh toán: '),
                    Text('22.000.000 đ',style: TextStyle(color: Colors.red),)
                  ],
                ),
              ],
            ),
            Divider(
              color: Colors.black38,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                child: Text("Đang xử lý"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black38,
                  elevation: 0,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
