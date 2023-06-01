import 'package:do_an_flutter/View/Auth/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Model/User.dart';
import '../../../Widget/Layout.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email=TextEditingController();
  TextEditingController _pasword=TextEditingController();
  TextEditingController _pasword1=TextEditingController();
  bool _check=false;
  void register(context){
    if(_email.text!=''&&_pasword.text!=''&&_pasword.text.length>=8&&_pasword1.text!=''&&_pasword.text==_pasword1.text){
      try{
        User.createUser(_email.text, _pasword.text);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LayoutWidget(title: 'Bán hàng'),
          ),
        );
        debugPrint('đăng ký thành công');
      }catch(e){
        debugPrint('đăng ký thất bại');
      }
    }else{
      debugPrint('đăng ký thất bại');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 100),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ĐĂNG KÝ',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
                // SizedBox(height: 20),
                // TextFormField(
                //   keyboardType: TextInputType.number,
                //   decoration: InputDecoration(
                //     labelText: "Số điện thoại",
                //     border: OutlineInputBorder(),
                //     prefixIcon: Icon(Icons.phone),
                //   ),
                // ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _pasword,
                  obscureText: _check?false:true,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: FaIcon(_check?FontAwesomeIcons.lockOpen:FontAwesomeIcons.lock),
                      onPressed: (){
                        setState(() {
                          _check=!_check;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _pasword1,
                  obscureText: _check?false:true,
                  decoration: InputDecoration(
                    labelText: "Nhập lại mật khẩu",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                  icon: FaIcon(_check?FontAwesomeIcons.lockOpen:FontAwesomeIcons.lock),
                  onPressed: (){
                    setState(() {
                      _check=!_check;
                    });
                  },
                ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: ElevatedButton(
                    child: Text(
                      "Đăng Ký",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      register(context);
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
                Text('Đã có tài khoản?'),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: ElevatedButton(
                    child: Text(
                      "Đăng nhập",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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
        ),
      ),
    );
  }
}
