import 'package:do_an_flutter/Model/Products.dart';

import 'Invoices.dart';

class InvoiceDetail {
  String? id;
  // List<Product> product;
  String? idProduct;
  String? idInvoice;
  // Invoice invoice;
  int? amount;
  int? promotion;
  bool? status;
  InvoiceDetail(
      {this.id,
      this.idProduct,
      this.idInvoice,
      this.amount,
      this.promotion,
      this.status});

  static List<InvoiceDetail> lstInvoiceDetail = [
    InvoiceDetail(
      id: '1',
      idProduct: 'ửewrwer',
      idInvoice: 'sdsdsdsd',
      amount: 10,
      promotion: 1,
      status: true,
    ),
    InvoiceDetail(
      id: '2',
      idProduct: 'ửewrwer',
      idInvoice: 'sdsdsdsd',
      amount: 10,
      promotion: 1,
      status: true,
    ),
    InvoiceDetail(
      id: '3',
      idProduct: 'ửewrwer',
      idInvoice: 'sdsdsdsd',
      amount: 10,
      promotion: 1,
      status: true,
    ),
  ];
}
