// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TabDaHuy extends StatelessWidget{
  const TabDaHuy ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
              Text('Đây là tab ĐÃ HỦY')
            ],
        ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}