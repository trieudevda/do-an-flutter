import 'package:flutter/material.dart';

import '../../Model/User.dart';
import '../../Widget/WidgetAll.dart';
import '../../Widget/constAll.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _controllerFullName=TextEditingController();
  TextEditingController _controllerSex=TextEditingController();
  TextEditingController _controllerPhone=TextEditingController();
  TextEditingController _controllerEmail=TextEditingController();
  TextEditingController _controllerAddress=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
  Widget btnEdit(BuildContext context,String value,User user,jsonUserUpdate) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.black12), // foreground border
      ),
      onPressed: () {
        setState(() {
          _controllerFullName.text=user.fullName??'';
          _controllerSex.text=user.sex??'';
          _controllerPhone.text=user.phone.toString()??'';
          _controllerEmail.text=user.email??'';
          _controllerAddress.text=user.address??'';
        });
        showDialogUser(user,jsonUserUpdate);
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
  Future<void> showDialogUser(User user,jsonUserUpdate){
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
                setState(() {
                  jsonUserUpdate['fullname']=_controllerFullName.text;
                });
                User.editProfile(
                  User(
                    fullName: _controllerFullName.text,
                    sex: _controllerSex.text,
                    phone: int.parse(_controllerPhone.text),
                    email: _controllerEmail.text,
                    address: _controllerAddress.text,
                  )
                );
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
      body: FutureBuilder<dynamic>(
        future: User.getUser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Text('Loading....');
          }
          if(snapshot.connectionState==snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }
          return Container(
            color: colorBgAll,
            child: Column(
              children: [
                Image.network(
                  snapshot.data['imgUrl']??'https://i.pinimg.com/originals/4f/dd/30/4fdd30c6a4e83370022b080095f09fe7.jpg',
                  fit: BoxFit.cover,
                  width: 100,
                ),
                showinfo('Tên',snapshot.data['fullName']??''),
                SizedBox(
                  height: heightSizedbox,
                ),
                showinfo('Giới tính',snapshot.data['sex']??''),
                showinfo('Điện thoại',snapshot.data['phone'].toString()??''),
                showinfo('Email',snapshot.data['email']??''),
                showinfo('Địa chỉ',snapshot.data['address']??''),
                showinfo('Tài khoản',snapshot.data['username']??''),
                Center(
                  child: btnEdit(
                    context,
                    'Sửa thông tin',
                    User(
                      fullName: snapshot.data['fullName'],
                      sex: snapshot.data['sex'],
                      phone: snapshot.data['phone'],
                      email: snapshot.data['email'],
                      address: snapshot.data['address'],
                      username: snapshot.data['username'],
                    ),
                    snapshot.data
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
