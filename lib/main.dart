import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'Widget/Layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Đồ án Flutter',
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home: LayoutWidget(title: 'Bán hàng'),
      // builder: EasyLoading.init(),
    );
  }
}