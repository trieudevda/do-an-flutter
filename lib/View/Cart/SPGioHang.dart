import 'package:flutter/material.dart';
import '../../Model/SanPham.dart';
// ignore: must_be_immutable
class SpGiohang extends StatelessWidget{
  SpGiohang({required this.sanpham});
  SanPham sanpham;
  @override
  Widget build (BuildContext context){
     String anh=sanpham.anh;
     int gia= sanpham.gia;
     //int giagiam=sanpham.giagiam;
     String ten=sanpham.ten;
     int soluong=sanpham.soluong;
    // bool sale=sanpham.sale;
    return Container(
         padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
         width: 1080,
        height: 195,
        color: Color.fromARGB(255, 255, 253, 253),
      child: Column(
children: [
  Row(children: [
    Checkbox(  
                      checkColor: const Color.fromARGB(255, 156, 153, 153),
                      activeColor: Color.fromARGB(255, 78, 77, 77), 
                      value: true, 
                      onChanged: (bool? value) { 
 
                      }, 
                    ),  
      Image.asset('images/$anh',width: 100, height: 100,fit: BoxFit.fill,),
      Container(
        padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
         width: 200,
        height: 105,
        child:Center(child: Column(children: [
      Text('$ten',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),),
 Container(
           padding: EdgeInsets.fromLTRB(0,5, 0, 0),
        child:
      Text('đ$gia',style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),))
     ]))
      )],),
    Container(
        padding: EdgeInsets.fromLTRB(50, 20, 0, 0),child:
   Row(children: [
     Text('Số lượng: $soluong'),
      Container(
           padding: EdgeInsets.fromLTRB(100,0, 0, 0),
        child: 
      Text(''))
   ],))
],
    ));
  }
}
