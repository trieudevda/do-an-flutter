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
                decoration: InputDecoration(
                  labelText: "Tên đăng nhập",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LayoutWidget(title: 'Bán hàng')));
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
              Text('Chưa có tài khoản?'),
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
