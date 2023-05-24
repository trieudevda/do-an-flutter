import 'package:flutter/material.dart';
import 'Tab/tabChoXuLy.dart';
import 'Tab/tabDaXuLy.dart';
import 'Tab/tabDaHuy.dart';
import 'Tab/tabADMIN.dart';

class TabControllerAdmin extends StatelessWidget{
  const TabControllerAdmin ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADMIN',
      //Xóa cái debug.
      debugShowCheckedModeBanner:false,
      //Chỉnh màu
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          //Màu viền dưới
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          //Màu chữ khi nhấn vào
          labelColor: Colors.black,
          //Màu chữ khi chưa nhấn vào
          unselectedLabelColor: Colors.white,
        ),
      ),
      //Title các tab
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar( 
              //Màu nền title.
              backgroundColor: Colors.red,
              bottom: const TabBar(
                tabs: [
                    Tab(text: 'Chờ xử lý',),
                    Tab(text: 'Đã xử lý',),
                    Tab(text: 'Đã hủy',),
                    Tab(text: 'ADMIN',),
                  ],
                ),
                // actions: [
                //   Title(color: Colors.white, child: const Text('LogOut'))
                // ],
                title: const Text('Quản lý đơn hàng', style: TextStyle(color: Colors.white,),),
                
            ),
            //Nội dung
            body: const TabBarView(
                children: [
                  TabChoXuLy(),
                  TabDaXuLy(),
                  TabDaHuy(),
                  TabAdmin(),
                ],
                
              ),
          ),
      ),
    );
  }

}