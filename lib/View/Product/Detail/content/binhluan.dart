import 'package:flutter/material.dart';

class BinhLuan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          height: 55,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.4),
          ),
          child: Row(
            children: [
              Container(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Đánh giá sản phẩm",
                  ),
                ),
              ),
              Spacer(),
              Icon(
                Icons.send,
                size: 28,
                color: Colors.grey,
              )
            ],
          ),
        ),
        SizedBox(
          height: 23,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.supervised_user_circle_sharp),
            Text(
              'user31312',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        Text(
          'Sản phẩm quá tuyệt vời!!',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.supervised_user_circle_sharp),
            Text(
              'user567534',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        Text(
          'Máy mới, rất đẹp!!',
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
