import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Slide extends StatelessWidget {
  const Slide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Center(
      //   child: Row(
      //     children: [
      //       Image.network(
      //         'https://i2-prod.mirror.co.uk/incoming/article25221903.ece/ALTERNATES/s1200/0_apple-black-friday-deals.jpg',
      //         fit: BoxFit.cover,
      //         width: MediaQuery.of(context).size.width,
      //         height: 200,
      //       ),
      //     ],
      //   ),
      // ),
        child: CarouselSlider(
          items: [
            Container(
              child: Center(child: Image.asset(
                "images/slide/images.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),),
            ),
            Container(
              child: Center(child: Image.asset(
                "images/slide/sale-khung-iphone-14-series-cuoi-nam-tai-topzone.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),),
            ),
            Container(
              child: Center(child: Image.asset(
                "images/slide/dattruoc-111_1280x720-800-resize.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
              ),
            ),
            Container(
              child: Center(child: Image.asset(
                "images/slide/Banner-web_1920x824-1-2.jpg",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 200,
              ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 200,
            enableInfiniteScroll: true,
            autoPlay: true,
          ),
        )
    );
  }
}
