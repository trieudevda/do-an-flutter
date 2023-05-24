import 'package:flutter/material.dart';
import '../../Model/SanPham.dart';

// ignore: must_be_immutable
class SpThanhToan extends StatelessWidget {
  SpThanhToan({required this.sanpham});
  SanPham sanpham;
  @override
  Widget build(BuildContext context) {
    String anh = sanpham.anh;
    int gia = sanpham.gia;
    String ten = sanpham.ten;
    return Container(
        padding: EdgeInsets.fromLTRB(10, 3, 0, 0),
        width: 1080,
        height: 120,
        color: Color.fromARGB(255, 255, 253, 253),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'images/$anh',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
                    width: 200,
                    height: 100,
                    child: Center(
                        child: Column(children: [
                      Text(
                        '$ten',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                          child: Text(
                            'đ$gia',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 126, 124, 124),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                        padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                        child: Text('x1'),
                      )
                    ])))
              ],
            ),
          ],
        ));
  }
}
