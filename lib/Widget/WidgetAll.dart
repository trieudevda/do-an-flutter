import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../View/Product/Product.dart';
import 'constAll.dart';

bool checkOutApp = false;

Widget searchAppbar(BuildContext context, TextEditingController search) {
  return TextFormField(
    onChanged: (value) {},
    controller: search,
    decoration: InputDecoration(
      labelText: "Tìm kiếm",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        borderSide: BorderSide(color: colorActive),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        borderSide: BorderSide(color: colorActive),
      ),
      // hintStyle: TextStyle(color: Colors.black),
      labelStyle: TextStyle(color: Colors.black12),
      suffixIcon: IconButton(
        icon: FaIcon(FontAwesomeIcons.magnifyingGlass,),
        color: colorActive,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => lstItem()));
        },
      ),
    ),
  );
}

BottomNavigationBar bottomNavigationBarAll(
    BuildContext context, int index, final onItemTapped) {
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
    selectedItemColor: colorActive,
    onTap: onItemTapped,
  );
}

Future<bool> onWillPopScopeFalse() async {
  return false;
}

Future<bool> onWillPopScopeTrue() async {
  return true;
}
