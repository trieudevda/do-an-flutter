class InvoiceDetail {
  String? id;
  String? idProduct;
  String? idInvoice;
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
