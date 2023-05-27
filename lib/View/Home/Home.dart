import 'package:flutter/material.dart';

import 'package:do_an_flutter/View/Home/Widget/Slide.dart';
import 'Widget/ProductGrid.dart';
import '../../Widget/constAll.dart';
import 'Widget/ProductGrid.dart';

// import 'Widget/Slide.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                      Image.network("https://cdn-icons-png.flaticon.com/512/1985/1985069.png", width: 40,),
                      Text('Smart Phone')
                    ],
                  ),
                  Column(
                    children: [
                      Image.network("https://cdn-icons-png.flaticon.com/512/2482/2482264.png", width: 40),
                      Text('Laptop')],
                  ),
                  Column(
                    children: [
                      Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNZ1vt9mSYPEq-T-T25huFaSkoOVlTxh24koyTNEga0CX4fyP7rz1dc5ltxdlUBWOMaG4&usqp=CAU", width: 40),
                      Text('Tablet')],
                  ),
                ],
              ),
            ),
          ),
          Container(
            // child: Padding(
            //   padding: EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       Text('Sản Phẩm Mới Nhất',textAlign: TextAlign.center,style: TextStyle(color: Colors.redAccent,fontSize: 20),),
            //       const ItemsWidget(),
            //     ],
            //   ),
            // ),
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(20),
            // color: Colors.white,
            child: Text('Sản Phẩm Mới Nhất',textAlign: TextAlign.center,style: TextStyle(color: Colors.redAccent,fontSize: 20)),
          ),
          Container(
            child: ProductGrid(),
            // ProductGrid(),
          ),

        ],
      ),
    );
  }
}