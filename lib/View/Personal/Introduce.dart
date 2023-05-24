import 'package:flutter/material.dart';

import '../../Widget/constAll.dart';

class IntroducePage extends StatelessWidget {
  const IntroducePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBodyBehindAppBar: true,
      appBar: AppBar(title: Text('Giới thiệu'), elevation: 0.0,backgroundColor: Color(0x44000000), ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://png.pngtree.com/png-vector/20230120/ourmid/pngtree-beauty-logo-design-png-image_6568470.png',
                fit: BoxFit.cover,
                width: 100,
              ),
              SizedBox(height: 15,),
              Text('v3.01.26.5.77.2',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20),)
            ],
          ),
        )
      ),
    );
  }
}
