import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget searchAppbar(BuildContext context,TextEditingController search){
  return TextField(
    onChanged: (value) { },
    controller: search,
    decoration: InputDecoration(
      labelText: "Tìm kiếm...",
      hintText: "Tìm kiếm",
      suffixIcon: IconButton(
        icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
        color: Colors.white,
        onPressed: (){},
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      hintStyle: TextStyle(color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
    ),
  );
}