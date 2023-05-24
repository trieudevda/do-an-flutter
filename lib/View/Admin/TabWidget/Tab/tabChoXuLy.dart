// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TabChoXuLy extends StatelessWidget{
  const TabChoXuLy ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
              Text('Đây là tab CHỜ XỬ LÝ')
            ],
        ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}