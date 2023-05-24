import 'package:flutter/material.dart';
//import 'package:product/item/allItems.dart';

import 'Allitem.dart';

class lstItem extends StatefulWidget {
  const lstItem({super.key});

  @override
  State<lstItem> createState() => _lstItemState();
}
class _lstItemState extends State<lstItem> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState(){
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }
  _handleTabSelection(){
    if(_tabController.indexIsChanging){
      setState(() {

      });
    }
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top:0),
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
                    borderSide: BorderSide(width: 1, color: Colors.red)
                ),
                // indicator: BoxDecoration(
                //   border: Border(
                //     right: BorderSide(width: 0, color: Colors.grey),
                //     left: BorderSide(color: Colors.grey),
                //     bottom: BorderSide(color: Colors.red),
                //   ),
                // ),
                tabs: [
                  Tab(text: "Liên quan",),
                  Tab(text: "Bán chạy",),
                  Tab(text: "Lọc v",),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: [
                ItemsWidget(),
                ItemsWidget(),
                Text("Chưa có"),
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