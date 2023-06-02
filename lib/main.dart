import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'View/Auth/Login/Login.dart';
import 'Widget/Layout.dart';
import 'Widget/constAll.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User? user) {
    if (user == null) {
      runApp(MyApp(login: false,));
    } else {
      // print(user);
      runApp(MyApp(login: true,));
    }
  });

}

class MyApp extends StatelessWidget {
  MyApp({super.key,required this.login});
  bool login;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Đồ án Flutter',
      theme: ThemeData(
        colorScheme: colorAppbar
      ),
      home: login?LayoutWidget(title: 'Bán hàng'):LoginPage(),
      // home: LayoutWidget(title: 'Bán hàng'),
      builder: EasyLoading.init(),
    );
  }
}
