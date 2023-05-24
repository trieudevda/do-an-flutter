class SanPham{
  SanPham({required this.ma,required this.anh, required this.gia, required this.ten,required this.giagiam,required this.sale,required this.soluong});
  int ma;
  String anh;
  int gia;
  String ten;
  int giagiam;
  bool sale;
int soluong;
static List<SanPham> lstSanPham= [
  SanPham(ma: 01, anh: 'anh1.jpg', gia: 20000000, ten: 'Iphone 14 ProMax - 128 GB', giagiam: 14600000, sale: true, soluong: 20),
 SanPham(ma: 02, anh: 'anh2.jpg', gia: 25000000, ten: 'Iphone 14 ProMax - 512 GB', giagiam: 0, sale: false, soluong: 30),
];
}