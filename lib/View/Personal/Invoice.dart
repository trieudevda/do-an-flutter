import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_an_flutter/Model/Invoices.dart';
import 'package:do_an_flutter/View/Personal/Widget/OneProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Model/Products.dart';
import '../../Widget/constAll.dart';
import 'Widget/OneInvoice.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePagePageState();
}

class _InvoicePagePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widget = [];
    // Invoice.createInvoice([
    // {"id":"3xzQHhHm7bsZVw2Khrcc","amount":'2'},
    // {"id":"4GXGJmT3T13ZQhRwiF31","amount":'3'},
    // {"id":"5WE2bOqWCLCESCgyTeLC","amount":'2'},
    //   {"id":"5c7VdZjPY5YCywp2iVkm","amount":'3'},
    //   {"id":"5fPFThtgL0rGf77DYEWx","amount":'2'},
    //   {"id":"69L5t7pw4Vx4osbIMayH","amount":'3'},
    // ], 'dien thoai, tablet, pc');
    // Invoice.getInvoice();

    Product.getProduct('0mVatnv6aaNgi9975NQV');
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: iconColorAppbar,
        ),
        title: Text(
          'Đơn hàng',
          style: titleAppbar,
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: Invoice.getInvoice(),
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
          final data=snapshot.data as List<Object?>;
          data.forEach((element) {
            Map<String, dynamic> data1=element as Map<String, dynamic>;
              _widget.add(
                OneInvoice(invoice: Invoice(id: data1['id'],idUser: data1['data']['idUser'],priceTotal: double.parse(data1['data']['priceTotal']),message: data1['data']['message'],status: data1['data']['status'],),),
              );
          });
          return ListView(children: _widget);
        },
      ),
    );
  }
}
