import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:do_an_flutter/Model/const_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import '../../../Model/Products.dart';
import '../../Product/Detail/productDetail.dart';

class ShowDemo extends StatelessWidget {
  List img = [
    'h1',
    'h2',
    'h3',
    'h4',
    'h5',
    'h6',
    'h7',
    'h8',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color.fromARGB(255, 233, 231, 231),
      ),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        shrinkWrap: true,
        childAspectRatio: (150 / 195),
        children: [
          for (int i = 0; i < img.length; i++)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDetails()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Image.asset(
                          "images/${img[i]}.jpg",
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            img[i],
                            style: TextStyle(fontSize: 16),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          Text(
                            'Giá gốc: 24.590.000 đ',
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.black38,
                                fontSize: 14),
                          ),
                          SizedBox(width: 10,),
                          Text(
                              'Loại SP: Smart Phone',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,)
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}

// class NewProductGrid extends StatefulWidget {
//   const NewProductGrid({Key? key}) : super(key: key);
//   @override
//   State<NewProductGrid> createState() => _NewProductGridState();
// }

// class _NewProductGridState extends State<NewProductGrid> {
//     Future<DocumentSnapshot<Map<String,dynamic>>> getProducts() async{
//       final data = await FirebaseFirestore.instance.collection(productFB).doc().get();
//       return data;
//     }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<dynamic> (
//       future: getProducts(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if(snapshot.connectionState==ConnectionState.waiting){
//           EasyLoading.show(status: 'Đang tải...') ;
//           return Container();
//         }
//         if(snapshot.connectionState!=ConnectionState.waiting){
//           EasyLoading.dismiss();
//         }
//         if(snapshot.connectionState==snapshot.hasError){
//           return Text('Error: ${snapshot.error}');
//         }
//         return Container(
//           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(2),
//             color: const Color.fromARGB(255, 233, 231, 231),
//           ),
//           child: GridView.count(
//             physics: NeverScrollableScrollPhysics(),
//             crossAxisCount: 2,
//             shrinkWrap: true,
//             childAspectRatio: (150 / 195),
//             children: [
//               // for (int i = 0; i < img.length; i++)
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => ProductDetails()),
//                   );
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(2),
//                     color: Color.fromARGB(255, 255, 255, 255),
//                   ),
//                   child: Column(
//                     children: [
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           margin: EdgeInsets.all(10),
//                           child: Image.asset(
//                             snapshot.data['imgUrl'],
//                             width: 120,
//                             height: 120,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                           padding: EdgeInsets.only(bottom: 10),
//                           child: Container(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               snapshot.data['name'],
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           )),
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 10),
//                         child: Column(
//                           children: [
//                             SizedBox(width: 10),
//                             Text(
//                                 'Giá: ${snapshot.data['price']}',
//                                 style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
//                             ),
//                             SizedBox(width: 10),
//                             Text(
//                                 snapshot.data['idCategoryProduct'],
//                                 style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,)
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }



//
// class _NewProductGridState extends State<NewProductGrid> {
//     Future<DocumentSnapshot<Map<String,dynamic>>> getProducts() async{
//       final data = await FirebaseFirestore.instance.collection(productFB).doc().get();
//       return data;
//     }
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//       future: getProducts(),
//       builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         else if (snapshot.hasError) {
//           return Text('Lỗi: ${snapshot.error}');
//         }
//         if(snapshot.connectionState==snapshot.hasError){
//           return Text('Error: ${snapshot.error}');
//         }
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//         else if (snapshot.hasError) {
//           return Text('Lỗi: ${snapshot.error}');
//         }
//         else if (snapshot.hasData && snapshot.data != null) {
//           final productData = snapshot.data!.data();
//           if (productData != null) {
//             // Xử lý và hiển thị dữ liệu sản phẩm tại đây
//             return ListView.builder(
//               itemCount: productData.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final product = productData[index];
//                 return Container(
//                   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(2),
//                     color: const Color.fromARGB(255, 233, 231, 231),
//                   ),
//                   child: GridView.count(
//                     physics: NeverScrollableScrollPhysics(),
//                     crossAxisCount: 2,
//                     shrinkWrap: true,
//                     childAspectRatio: (150 / 195),
//                     children: [
//                       // for (int i = 0; i < img.length; i++)
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => ProductDetails()),
//                           );
//                         },
//                         child: Container(
//                           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(2),
//                             color: Color.fromARGB(255, 255, 255, 255),
//                           ),
//                           child: Column(
//                             children: [
//                               InkWell(
//                                 onTap: () {},
//                                 child: Container(
//                                   margin: EdgeInsets.all(10),
//                                   child: Image.asset(
//                                     product['imgUrl'],
//                                     width: 120,
//                                     height: 120,
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                   padding: EdgeInsets.only(bottom: 10),
//                                   child: Container(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(
//                                       product['name'],
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                   )),
//                               Padding(
//                                 padding: EdgeInsets.only(bottom: 10),
//                                 child: Column(
//                                   children: [
//                                     SizedBox(width: 10),
//                                     Text(
//                                         'Giá: ${product['price']}',
//                                         style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)
//                                     ),
//                                     SizedBox(width: 10),
//                                     Text(
//                                         product['idCategoryProduct'],
//                                         style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,)
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//         }
//         return Text('Không có dữ liệu');
//       },
//     );
//   }
// }