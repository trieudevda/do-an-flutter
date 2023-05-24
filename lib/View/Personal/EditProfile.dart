import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Widget/constAll.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Widget btnEdit(String title, String value){
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.black12), // foreground border
      ),
      onPressed: () {  },
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Row(
              children: [
                Text(value),
                Icon(Icons.navigate_next,color: Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sửa hồ sơ'),
      ),
      body: Container(
        color: colorBgAll,
        child: Column(
          children: [
            Image.network(
              'https://png.pngtree.com/png-vector/20230120/ourmid/pngtree-beauty-logo-design-png-image_6568470.png',
              fit: BoxFit.cover,
              width: 100,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
            btnEdit('Tên','Thanh Triều'),
            SizedBox(height: heightSizedbox,),
            btnEdit('Giới tính','Nam'),
            btnEdit('Ngày sinh','25/11/2001'),
          ],
        ),
      ),
    );
  }
}
