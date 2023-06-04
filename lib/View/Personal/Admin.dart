import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Model/Invoices.dart';
import '../../Widget/WidgetAll.dart';
import '../../Widget/constAll.dart';
import 'Widget/OneInvoice.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  List<Widget> _widget = [];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPopScopeFalse,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: iconColorAppbar,
          ),
          title: Text('Admin',style: titleAppbar,),
        ),
        body: FutureBuilder<dynamic>(
          future: Invoice.getAllInvoice(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              EasyLoading.show(status: 'Đang tải...');
              return Container();
            }
            if (snapshot.connectionState != ConnectionState.waiting) {
              EasyLoading.dismiss();
            }
            if (snapshot.connectionState == snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            var data=snapshot.data as List<Object?>;
            data.forEach((element) {
              Map<String, dynamic> data1=element as Map<String, dynamic>;
              _widget.add(
                Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  margin: EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // OneInvoice(invoice: Invoice(id: data1['id'],idUser: data1['data']['idUser'],priceTotal: double.parse(data1['data']['priceTotal']),message: data1['data']['message'],status: data1['data']['status'],),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mã đơn hàng: ${data1['id']}',textAlign: TextAlign.left,),
                          Text('Tổng tiền: ${data1['data']['priceTotal']}',textAlign: TextAlign.left,),
                          Text('Ghi chú: ${data1['data']['message']}',textAlign: TextAlign.left,),
                        ],
                      ),
                      IconButton(onPressed: (){Invoice.checkInvoice(data1['id']);data=snapshot.data as List<Object?>;setState(() {

                      });}, icon: Icon(Icons.check)),
                    ],
                  ),
                ),
              );
            });
            return ListView(children: _widget);
          },
        ),
      ),
    );
  }
}
