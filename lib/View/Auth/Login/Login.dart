import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Model/User.dart';
import '../../../Widget/Layout.dart';
import '../../../Widget/WidgetAll.dart';
import '../../Home/Home.dart';
import '../Register/Register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _check=false;
  void login(context) {
    if (_email.text != '' && _email != '') {
      // EasyLoading.show(status: 'Đang tải...');
      User.signInUser(_email.text, _password.text,context);
      // EasyLoading.removeAllCallbacks();
    } else {
      // EasyLoading.removeAllCallbacks();
      debugPrint('dang nhap that bai');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPopScopeFalse,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width*0.8,
            padding: EdgeInsets.symmetric( vertical: 100),
            child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/icondn.png",
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(height: 50),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      decoration: InputDecoration(
                        labelText: "Tên đăng nhập",
                        labelStyle:TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.person,),
                        suffixIconColor: Colors.black12,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: _check?false:true,
                      controller: _password,
                      decoration: InputDecoration(
                        labelText: "Mật khẩu",
                        labelStyle:TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon:FaIcon(_check?FontAwesomeIcons.lockOpen:FontAwesomeIcons.lock),
                          onPressed: (){
                            setState(() {
                              _check=!_check;
                            });
                          },
                        ),
                        suffixIconColor: Colors.black12,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      child: ElevatedButton(
                        child: Text(
                          "Đăng Nhập",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          login(context);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>((states) {
                            return Colors.red;
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Bạn chưa có tài khoản?'),
                        TextButton(
                          child: Text(
                            "Đăng ký ngay",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                            );
                          },
                          // style: ButtonStyle(
                          //   backgroundColor:
                          //   MaterialStateProperty.resolveWith<Color>((states) {
                          //     return Colors.red;
                          //   }),
                          // ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
          ),
        )),
    );
  }
}
