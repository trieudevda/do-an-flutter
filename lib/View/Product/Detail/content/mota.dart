import 'package:flutter/material.dart';

class MoTa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Danh mục',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Thương hiệu',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Dung lượng lưu trữ',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Độ phân giải camera',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Loại bảo hành',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Hạn bảo hành',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'RAM',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Tình trạng',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Bộ xử lý',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Model điện thoại',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 30,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Điện thoại',
              style: TextStyle(
                fontSize: 18,
                // color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Apple',
              style: TextStyle(
                fontSize: 18,
                //color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '512GB',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '12MP',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Nhà sản xuất',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '12 tháng',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '6GB',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Mới',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Apple A16 Bionic',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'iPhone 14 Pro 512GB',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        )
      ],
    );
  }
}
