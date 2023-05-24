import 'package:flutter/material.dart';

import '../../Widget/constAll.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);
  Widget btnAddress(){
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black38,
        side: BorderSide(color: Colors.black12), // foreground border
      ),
      onPressed: () {  },
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Thanh Triều',style: TextStyle(color: Colors.black),),
                Text(' | (+84) 365 931 327'),
              ],
            ),
            SizedBox(height: heightSizedbox/3,),
            Text('35 đường 597'),
            SizedBox(height: heightSizedbox/3,),
            Text('Củ Chi, Thành Phố Hồ Chí Minh'),
            SizedBox(height: heightSizedbox/3,),
            Container(
              padding: EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.redAccent),
              ),
              child: Text('Mặc định',style: TextStyle(color: Colors.redAccent),),
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn ngôn ngữ'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.check),),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 10,bottom: 10,left: 15),
              child: Text('Địa chỉ',style: TextStyle(color: Colors.black38),),
            ),
            btnAddress(),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.redAccent,
              ),
              onPressed: () {  },
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outline),
                      Text('Thêm Địa Chỉ Mới')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
