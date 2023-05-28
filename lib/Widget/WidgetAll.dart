import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool checkOutApp=false;

Widget searchAppbar(BuildContext context,TextEditingController search){
  return TextField(
    onChanged: (value) { },
    controller: search,
    decoration: InputDecoration(
      labelText: "Tìm kiếm",
      hintText: "Tìm kiếm",
      suffixIcon: IconButton(
        icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
        color: Colors.black,
        onPressed: (){},
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      // hintStyle: TextStyle(color: Colors.black),
      labelStyle: TextStyle(color: Colors.black),
    ),
  );
}
BottomNavigationBar bottomNavigationBarAll(BuildContext context,int index,final onItemTapped){
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.home),
        label: 'Trang chủ',
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.cartShopping),
        label: 'Giỏ hàng',
      ),
      BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.user),
        label: 'Tài khoản',
      ),
    ],
    currentIndex: index,
    selectedItemColor: Colors.blue,
    onTap: onItemTapped,
  );
}
Future<bool> onWillPopScopeFalse()async{
  return false;
}
Future<bool> onWillPopScopeTrue()async{
  return true;
}
