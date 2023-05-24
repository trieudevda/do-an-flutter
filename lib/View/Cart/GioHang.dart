import 'package:flutter/material.dart';
import 'SPGioHang.dart';
import '../../Model/SanPham.dart';
import 'ThanhToan.dart';

class GioHang extends StatefulWidget {
  GioHang({super.key,});
  @override
  _State createState() => _State();
}

class _State extends State<GioHang> {
  int tong=0;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              for (int i = 0; i < SanPham.lstSanPham.length; i++)
                SpGiohang(sanpham: SanPham.lstSanPham[i]),
            ],
          ),
          Container(
              width: 1080,
              height: 67,
              color: Colors.white,
              child: Row(children: [
                Checkbox(
                  checkColor: const Color.fromARGB(255, 156, 153, 153),
                  activeColor: Color.fromARGB(255, 78, 77, 77),
                  value: false,
                  onChanged: (bool? value) {},
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Text('Tất cả'),
                ),
 Container(
                  padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
                  child: Text('Tổng giá tiền'),
                ),
                 Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: ElevatedButton(
              
                    onPressed: () {  
  Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) => ThanhToan()),  
  );  
                  }, 
                  style: ElevatedButton.styleFrom(
             primary: Colors.red, // background
             onPrimary: Colors.white, // foreground
           ),
                  child: Text('Mua Hàng (0)',style: TextStyle(fontWeight: FontWeight.bold),))
                ),


              ]))
        ]);
  }
}
