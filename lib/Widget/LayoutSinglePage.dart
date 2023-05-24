import 'package:do_an_flutter/View/Home/Home.dart';
import 'package:do_an_flutter/View/Personal/Personal.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../View/Product/Product.dart';
import 'WidgetAll.dart';

class LayoutWidgetSinglePage extends StatefulWidget {
  LayoutWidgetSinglePage({super.key, required this.page});
  Widget page;
  @override
  State<LayoutWidgetSinglePage> createState() => _LayoutWidgetSinglePageState();
}

class _LayoutWidgetSinglePageState extends State<LayoutWidgetSinglePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerSearch = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const Center(child: FaIcon(FontAwesomeIcons.chevronLeft)),
        actions: [
          IconButton(onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.gear)),
        ],
        title:Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: searchAppbar(context,_controllerSearch),
        ),
      ),
      body:SingleChildScrollView(
        child: widget.page,
      ),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) { },
      // controller: editingController,
      decoration: InputDecoration(
        labelText: "Tìm kiếm...",
        hintText: "Tìm kiếm",
        suffixIcon: IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: (){},
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
