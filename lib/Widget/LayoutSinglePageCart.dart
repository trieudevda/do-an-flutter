import 'package:do_an_flutter/View/Home/Home.dart';
import 'package:do_an_flutter/View/Personal/Personal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../View/Cart/GioHang.dart';
import '../View/Product/Detail/content/themMua.dart';
import '../View/Product/Product.dart';
import 'WidgetAll.dart';

class LayoutWidgetSinglePageCart extends StatefulWidget {
  LayoutWidgetSinglePageCart({super.key, required this.page});
  Widget page;
  @override
  State<LayoutWidgetSinglePageCart> createState() =>
      _LayoutWidgetSinglePageCartState();
}

class _LayoutWidgetSinglePageCartState
    extends State<LayoutWidgetSinglePageCart> {
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
          icon: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.red,
              )),
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
      bottomNavigationBar: ThemMua(),
    );
  }
}
