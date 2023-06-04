import 'package:do_an_flutter/Model/InvoiceDetails.dart';
import 'package:flutter/material.dart';

import '../../Widget/constAll.dart';

class InvoiceDetailPage extends StatefulWidget {
  InvoiceDetailPage({super.key,required this.id});
  String id;
  @override
  State<InvoiceDetailPage> createState() => _InvoiceDetailPageState();
}

class _InvoiceDetailPageState extends State<InvoiceDetailPage> {
  @override
  Widget build(BuildContext context) {
    InvoiceDetail.getInvoiceDetail(widget.id);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: iconColorAppbar,
        ),
        title: Text('Chi tiết đơn hàng',style: titleAppbar,),
      ),
      body: Container(
        child: Text(widget.id),
      ),
    );
  }
}
