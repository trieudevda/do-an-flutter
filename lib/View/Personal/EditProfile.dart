import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Model/User.dart';
import '../../Widget/WidgetAll.dart';
import '../../Widget/constAll.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Map<String,dynamic> data={
    'imgUrl':'https://png.pngtree.com/png-vector/20230120/ourmid/pngtree-beauty-logo-design-png-image_6568470.png',
    'fullname':'Thanh Triều',
    'sex':'Nam',
    'phone':'0365931247',
    'email':'demo@gmail.com',
    'address':'tp hcm',
    'username':'trieupro',
    'isAdmin':false,
  };
  final _user=User(
    imgUrl: 'https://png.pngtree.com/png-vector/20230120/ourmid/pngtree-beauty-logo-design-png-image_6568470.png',
    fullName: 'Nguyễn Thanh Triều',
    sex: 'Nam',
    phone: 0365931247,
    email: 'demo@gmail.com',
    address: 'tp hcm',
    username: 'trieu.de.da',
    status: true,
    isAdmin: false,
  );
  TextEditingController _controllerFullName=TextEditingController();
  TextEditingController _controllerSex=TextEditingController();
  TextEditingController _controllerPhone=TextEditingController();
  TextEditingController _controllerEmail=TextEditingController();
  TextEditingController _controllerAddress=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerFullName.text=_user.fullName??'';
    _controllerSex.text=_user.sex??'';
    _controllerPhone.text=_user.phone.toString()??'';
    _controllerEmail.text=_user.email??'';
    _controllerAddress.text=_user.address??'';
  }
  Widget showinfo(String title, String value){
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10,left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
  Widget btnEdit(BuildContext context,String value) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.black12), // foreground border
      ),
      onPressed: () {
        showDialogUser(_user);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value),
            Icon(Icons.navigate_next, color: Colors.black),
          ],
        ),
      ),
    );
  }
  Future<void> showDialogUser(User user){
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context){
        return AlertDialog(
          titlePadding: EdgeInsets.all(0),
          title: Container(
            decoration: BoxDecoration(color: Colors.blue),
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Text("Sửa Thông Tin",textAlign: TextAlign.center,),
          ),
          content: Container(
            height: 240,
            child: Column(
              children: [
                // Text(user.imgUrl??''),
                TextField(
                  controller: _controllerFullName,
                  decoration: InputDecoration(
                      hintText: 'Họ Tên'
                  ),
                ),
                TextField(
                  controller: _controllerSex,
                  decoration: InputDecoration(
                      hintText: 'Giới tính'
                  ),
                ),
                TextField(
                  controller: _controllerPhone,
                  decoration: InputDecoration(
                      hintText: 'Số điện thoại'
                  ),
                ),
                TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                      hintText: 'Email'
                  ),
                ),
                TextField(
                  controller: _controllerAddress,
                  decoration: InputDecoration(
                      hintText: 'Địa chỉ'
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Hủy",style: titleAppbar,),
              onPressed: () {Navigator.pop(context);},
            ),
            TextButton(
              child: Text("Thay đổi",style: titleAppbar,),
              onPressed: () {
                User.editProfile(_user);
              },
            ),
          ],
        );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: iconColorAppbar,
        ),
        title: const Text('Sửa hồ sơ',style: titleAppbar,),
      ),
      body: Container(
        color: colorBgAll,
        child: Column(
          children: [
            Image.network(
              data['imgUrl'],
              fit: BoxFit.cover,
              width: 100,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
            showinfo('Tên',_user.fullName??''),
            SizedBox(
              height: heightSizedbox,
            ),
            showinfo('Giới tính',_user.sex??''),
            showinfo('Điện thoại',_user.phone.toString()??''),
            showinfo('Email',_user.email??''),
            showinfo('Địa chỉ',_user.address??''),
            showinfo('Tài khoản',_user.username??''),
            Center(
              child: btnEdit(context,'Sửa thông tin'),
            ),
          ],
        ),
      ),
    );
  }
}
