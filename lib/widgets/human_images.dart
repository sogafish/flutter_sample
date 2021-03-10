import 'package:flutter/material.dart';

Widget humanImages = Container(
  margin: EdgeInsets.only(top: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildImageContainer('assets/images/abe.jpg', false),
      _buildImageContainer('https://www.nikkansports.com/entertainment/column/umeda/news/img/202008050000021-w500_0.jpg', true),
    ],
  ),
);

Expanded _buildImageContainer(String imgSrc, bool isNetwork) {
  return Expanded(
    child: isNetwork ? Image.network(imgSrc) : Image.asset(imgSrc),
  );
}
