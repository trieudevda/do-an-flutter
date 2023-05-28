import 'package:do_an_flutter/View/Home/Home.dart';
import 'package:do_an_flutter/View/Personal/Personal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../View/Cart/GioHang.dart';
import '../View/Product/Product.dart';
import 'WidgetAll.dart';

class LayoutWidget extends StatefulWidget {
  LayoutWidget({super.key, required this.title});
  String title;

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  TextEditingController _controllerSearch = TextEditingController();
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    // lstItem(),
    GioHang(),
    PersonalPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPopScopeFalse,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => lstItem()));
                }, icon: const FaIcon(FontAwesomeIcons.gear,color: Colors.red,)),
          ],
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: searchAppbar(context, _controllerSearch),
          ),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: bottomNavigationBarAll(context,_selectedIndex,_onItemTapped),
      ),
    );
  }
}
