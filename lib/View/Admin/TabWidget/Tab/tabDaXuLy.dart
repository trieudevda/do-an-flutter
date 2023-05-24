// ignore_for_file: file_names
import 'package:flutter/material.dart';

class TabDaXuLy extends StatelessWidget{
  const TabDaXuLy ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
              Text('Đây là tab ĐÃ XỬ LÝ')
            ],
        ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}