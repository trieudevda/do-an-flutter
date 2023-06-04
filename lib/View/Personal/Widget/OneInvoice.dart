import 'package:do_an_flutter/Model/Invoices.dart';
import 'package:flutter/material.dart';
import 'dart:core';

import '../InvoiceDetail.dart';

class OneInvoice extends StatelessWidget {
  OneInvoice({Key? key,required this.invoice}) : super(key: key);
  Invoice invoice;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) =>
                InvoiceDetailPage(id: invoice.id!,)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(.2),
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mã đơn hàng: ${invoice.id}',textAlign: TextAlign.left,),
                Text('Tổng tiền: ${invoice.priceTotal}',textAlign: TextAlign.left,),
                Text('Ghi chú: ${invoice.message}',textAlign: TextAlign.left,),
              ],
            ),
            Text('${invoice.status}',textAlign: TextAlign.right,),
          ],
        ),
      ),
    );
  }
}
