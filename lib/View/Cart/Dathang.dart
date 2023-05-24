import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DatHang(),
  ));
}

class DatHang extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DatHang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mobile App'),
        ),
        body: Column(children: [
          Container(
            width: 1080,
            height: 60,
            color: Color.fromARGB(255, 175, 175, 175),
            padding: EdgeInsets.fromLTRB(50, 18, 0, 0),
            child: Text(
              'Thanh Toán',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 1080,
            height: 100,
            color: Colors.white,
          ),
          Container(
            width: 1080,
            height: 100,
            color: Color.fromARGB(255, 171, 170, 170),
            child: Column(
              children: [
                Text('Bạn đã đặt hàng thành công',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text(''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Text(
                        'Xem đơn hàng',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                        child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      child: Text(
                        'Về trang chủ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ))
                  ],
                )
              ],
            ),
          )
        ]));
  }
}
// }
// class ThongBao extends StatelessWidget{
//   ThongBao({required this.title1,required this.title2});
//   String title1;
//   String title2;
//   @override
//   Widget build (BuildContext context){
//     return Container(
//       width: 1080,
//       height: 400,
//       padding: EdgeInsets.fromLTRB(100, 500, 100, 500),
//       child: Column(
//         children: [
//           Text('Bạn đã đặt hàng thành công',style: TextStyle(color:Colors.red)),
//           Row(children: [
//             ElevatedButton(onPressed: () {},   style: ElevatedButton.styleFrom(
//              primary: Colors.red, // background
//              onPrimary: Colors.white, // foreground
//            ),
//            child: Text('$title1',style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),),)
//           ],)
//         ],
//       ),

//     );
//   }
// }