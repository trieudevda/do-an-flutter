import 'package:flutter/material.dart';

class Slide extends StatelessWidget {
  const Slide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Image.network(
              'https://i2-prod.mirror.co.uk/incoming/article25221903.ece/ALTERNATES/s1200/0_apple-black-friday-deals.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
            // Image.network('https://i2-prod.mirror.co.uk/incoming/article25221903.ece/ALTERNATES/s1200/0_apple-black-friday-deals.jpg', fit: BoxFit.cover, width: 446, height: 200,),
          ],
        ),
      ),
    );
  }
}
