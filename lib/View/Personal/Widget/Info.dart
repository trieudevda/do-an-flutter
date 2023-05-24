import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 30,bottom: 30,left: 10,right: 10),
      decoration: BoxDecoration(
        color: Colors.black12,
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network('https://i.pinimg.com/originals/4f/dd/30/4fdd30c6a4e83370022b080095f09fe7.jpg',scale: 1,fit: BoxFit.cover,width: 100,height: 100,),
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text('Nguyễn Thanh Triều',textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text('Giới thiệu: Nam',textAlign: TextAlign.left,style: TextStyle(fontSize: 14),),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text('Ngày sinh: 25/11/2001',textAlign: TextAlign.left,style: TextStyle(fontSize: 14),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                    decoration: BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Text('Thành viên',style: TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
