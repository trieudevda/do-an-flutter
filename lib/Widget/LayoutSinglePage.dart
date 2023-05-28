import 'package:do_an_flutter/Model/Products.dart';
import 'package:do_an_flutter/View/Home/Home.dart';
import 'package:do_an_flutter/View/Personal/Personal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../View/Cart/GioHang.dart';
import '../View/Product/Product.dart';
import 'WidgetAll.dart';

class LayoutWidgetSinglePage extends StatefulWidget {
  LayoutWidgetSinglePage({super.key, required this.page});
  Widget page;
  @override
  State<LayoutWidgetSinglePage> createState() => _LayoutWidgetSinglePageState();
}

class _LayoutWidgetSinglePageState extends State<LayoutWidgetSinglePage> {
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
    return Scaffold(
      appBar: AppBar(
        leading: Center(
            child: IconButton(
          icon: FaIcon(FontAwesomeIcons.chevronLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => lstItem()));
            },
            icon: const FaIcon(
              FontAwesomeIcons.gear,
              color: Colors.red,
            ),
          ),
        ],
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: searchAppbar(context, _controllerSearch),
        ),
      ),
      body: SingleChildScrollView(
        child: widget.page,
      ),
      bottomNavigationBar:
          bottomNavigationBarAll(context, _selectedIndex, _onItemTapped),
    );
  }
}
