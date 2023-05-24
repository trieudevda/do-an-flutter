// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../testScreen.dart';
// import 'package:admin/Model/testScreen.dart';

class TabAdmin extends StatelessWidget{
  const TabAdmin ({super.key});

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: const [
    //       Text('Đây là tab ADMIN'),
    //       ElevatedButton(onPressed: null, child: Text('LogOut')),
    //     ],
    // );
    return Scaffold(
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('============================'),
            const Text('=          ADMIN           ='),
            const Text('============================'),
            ElevatedButton(
              style:
              //Chỉnh Style nút.
                ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>const TestScreen()));
              }, 
              child: const Text('LogOut'),
            ),
          ],
        ),
      ),  
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}