import 'package:do_an_flutter/View/Home/Home.dart';
import 'package:do_an_flutter/View/Personal/Widget/Info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Widget/constAll.dart';
import 'Address.dart';
import 'EditProfile.dart';
import 'Introduce.dart';
import 'Language.dart';
import 'Widget/OneProduct.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  int index=0;bool loading = false;
  Widget btnIconStatus(BuildContext context,String image,String text,int value){
    return TextButton(
      onPressed: (){
        setState(() {
          index=value;
        });
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: 40,
            color: index==value?Colors.blue:Colors.black,
          ),
          Text(text,textAlign: TextAlign.center,style: TextStyle(color: index==value?Colors.blue:Colors.black),)
        ],
      ),
    );
  }
  Widget btnSetting(BuildContext context,String text,Widget page){
    return TextButton(
      onPressed: (){
        if(page!=null){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
        else{
          print('chưa gắn trang');
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,style: TextStyle(color: Colors.black),),
              Icon(Icons.navigate_next,color: Colors.black),
            ],
          ),
          Divider(color: Colors.black,),
        ],
      ),
    );
  }
  List<Widget> lstProduct=[
    Column(children: [OneProduct(),],),
    Column(children: [OneProduct(),OneProduct(),],),
    Column(children: [OneProduct(),OneProduct(),OneProduct(),],),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBgAll,
      child: ListView(
        children: [
          const Info(),
          const SizedBox(height: 15.0,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                btnIconStatus(context,'images/time.png','Chờ giao hàng',0),
                btnIconStatus(context,'images/Waiting.png','Chờ lấy hàng',1),
                btnIconStatus(context,'images/delivered.png','Đã giao',2),
              ],
            ),
          ),
          lstProduct[index],
          TextButton(
              style: TextButton.styleFrom(
                //backgroundColor: Colors.white,
                foregroundColor: Colors.red,
              ),
              onPressed: () { print(index); },
              child: const Text('Xem thêm >', style: TextStyle(fontSize: 16,decoration: TextDecoration.underline)),
          ),
          btnSetting(context,'Đơn mua',EditProfilePage()),
          btnSetting(context,'Thiết lập tài khoản',EditProfilePage()),
          btnSetting(context,'Ngôn ngữ',LanguagePage()),
          btnSetting(context,'Địa chỉ',AddressPage()),
          btnSetting(context,'Giới thiệu',IntroducePage()),
        ],
      ),
    );
  }
}
