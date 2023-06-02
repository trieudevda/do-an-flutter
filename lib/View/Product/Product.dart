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
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
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
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(
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
                dividerColor: Colors.grey,
                indicatorColor: Colors.red,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.black,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 1, color: Colors.red)
                ),
                tabs: [
                  Tab(text: "Liên quan",),
                  Tab(text: "Khuyến mãi",),
                  Tab(text: "Lọc <>",),
                ],
                
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                // indicator: BoxDecoration(
                //       border: Border(
                //         top: BorderSide(color: Colors.grey),
                //         right: BorderSide(color: Colors.grey),
                //         left: BorderSide(color: Colors.grey),
                //         bottom: BorderSide(color: Colors.red),
                //       ),
                //       color: Color.fromARGB(255, 238, 236, 236), 
                // ),
              ), 

            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(child: Center(child: Text('people'))),
                  Container(
                    child: ListView(
                      children: [
                        ItemsWidget(),
                      ],
                    ),
                  ),
                  Text('Chưa có'),
                ],
                controller: _tabController,
              ),
            ),
          
          ]
          ),
        ),
      );
  }
}
