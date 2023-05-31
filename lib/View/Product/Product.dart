import 'package:do_an_flutter/View/Product/Detail/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:product/item/allItems.dart';

import '../../Widget/WidgetAll.dart';
import 'Allitem.dart';

class lstItem extends StatefulWidget {
  const lstItem({super.key});

  @override
  State<lstItem> createState() => _lstItemState();
}

class _lstItemState extends State<lstItem> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController _controllerSearch = TextEditingController();
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.gear)),
        ],
        title: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: searchAppbar(context, _controllerSearch),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: ListView(
          children: [
            // Text("─────────Có thể bạn cũng thích─────────",textAlign: TextAlign.center,),
            // SizedBox(height: 30,),
            // ItemsWidget(),
            // SizedBox(height: 20,),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  left: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                ),
                color: const Color.fromARGB(255, 228, 227, 227),
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.red,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 1, color: Colors.red)),
                // indicator: BoxDecoration(
                //   border: Border(
                //     right: BorderSide(width: 0, color: Colors.grey),
                //     left: BorderSide(color: Colors.grey),
                //     bottom: BorderSide(color: Colors.red),
                //   ),
                // ),
                tabs: [
                  Tab(
                    text: "Liên quan",
                  ),
                  Tab(
                    text: "Bán chạy",
                  ),
                  Tab(
                    text: "Lọc <>",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: [
                ItemsWidget(),
                ItemsWidget(),
                ProductDetails(),
                //ItemsWidget(),
              ][_tabController.index],
            )
            // Center(
            //     child: [
            //       ItemsWidget(),
            //       ItemsWidget(),
            //       Text("Chưa có"),
            //       ItemsWidget(),
            //     ][_tabController.index],
            // ),
          ],
        ),
      ),
    );
  }
}
