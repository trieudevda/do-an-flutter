import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:product/item/allItems.dart';

import '../../Model/const_model.dart';
import '../../Widget/WidgetAll.dart';
import 'Allitem.dart';

class lstItem extends StatefulWidget {
  const lstItem({super.key});

  @override
  State<lstItem> createState() => _lstItemState();
}

class _lstItemState extends State<lstItem> with SingleTickerProviderStateMixin {
  Future<DocumentSnapshot<Map<String,dynamic>>> getProducts()async{
    final data=await FirebaseFirestore.instance.collection(productFB).doc().get();
    return data;
  }
  //late List lazyList;
  // ScrollController _scrollController =ScrollController();
  // int _currentMax = 10;
  late TabController _tabController;
  TextEditingController _controllerSearch = TextEditingController();
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
    //lazyList = List.generate(_currentMax, (index) => "Item : ${index + 1}");
    // _scrollController.addListener(() {
    //   if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
    //     _getMoreList();
    //   }
    // });
  }
  // _getMoreList(){
  //   for(int i = _currentMax; i<_currentMax + 10; i++){
  //     lazyList.add("Item : ${i + 1}");
  //   }
  //   _currentMax = _currentMax + 10;
  //   setState(() {});
  // }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getProducts();
    debugPrint(getProducts().toString());
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
            SizedBox(height: 20,),
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
                  Container(
                    // child: ListView.builder(
                    //   controller: _scrollController,
                    //   itemExtent: 60,
                    //   itemBuilder: (context, index){
                    //     if(index == lazyList.length){
                    //       return CupertinoActivityIndicator();
                    //     }
                    //     return ItemsWidget();
                    //   },
                    //   itemCount: lazyList.length + 1,
                    // )
                    child: ListView(
                      children: [   
                        SizedBox(height: 10,),
                        ItemsWidget(),  
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: [   
                        SizedBox(height: 10,),
                        ItemsWidget(),  
                      ],
                    ),
                  ),
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
