import 'package:flutter/material.dart';
import 'SPThanhToan.dart';
import '../../Model/SanPham.dart';
import 'GioHang.dart';
import 'Dathang.dart';
void main() {
  runApp(MaterialApp(
    home: ThanhToan(),
  ));
}

class ThanhToan extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ThanhToan> {
  int gia = SanPham.lstSanPham[0].gia;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mobile App'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          
          Container(
            width: 1080,
            height: 120,
            color: Colors.white,
            child: Column(children: [
              note(title: 'Địa chỉ nhận hàng...'),
              note(title: 'Số điện thoại')
            ]),
          ),
          SpThanhToan(sanpham: SanPham.lstSanPham[0]),
          note(title: 'Ghi chú cho người bán'),
          Container(
              width: 600,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration:BoxDecoration(border: Border.all(width:0.5,color: Colors.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tổng số tiền 1 sản phẩm'),
                  Text(
                    '$gia',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
          Container(
              width: 600,
              padding: EdgeInsets.fromLTRB(0, 30,0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Tổng thanh toán',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                     Container(padding:EdgeInsets.fromLTRB(0, 10,0,0),
                      child:Text(
                        '$gia',
                        style: TextStyle(color: Colors.red),
                      ))
                    ],
                  ),
              
                       ElevatedButton(
                          onPressed: () {
                            Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) => DatHang()),  
  );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          child: Text(
                            'Đặt hàng ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                ],
              ))
        ]));
  }
}

class note extends StatelessWidget {
  note({required this.title});
 final String title;
  @override
  Widget build(BuildContext context) {
    return
    Container(
      decoration: BoxDecoration(border: Border.all(width:0.5,color: Colors.black)),
      child: TextField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: title,
      ),
    ));
  }
}
