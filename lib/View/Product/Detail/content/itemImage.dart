import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 1; i < 4; i++)
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Expanded(
                  child: Image.asset(
                    'images/$i.png',
                    height: 222,
                    width: 400,
                    fit: BoxFit.fitWidth,
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
