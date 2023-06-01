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
      User.signInUser(_email.text, _password.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LayoutWidget(title: 'Bán hàng'),
        ),
      );
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
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 100),
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
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: _check?false:true,
                controller: _password,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon:FaIcon(_check?FontAwesomeIcons.lockOpen:FontAwesomeIcons.lock),
                    onPressed: (){
                      setState(() {
                        _check=!_check;
                      });
                    },
                  ),
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
              Text('Bạn chưa có tài khoản?'),
              SizedBox(
                height: 8,
              ),
              Container(
                child: ElevatedButton(
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.resolveWith<Color>((states) {
                      return Colors.red;
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ))),
    );
  }
}
