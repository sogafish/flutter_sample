import 'package:flutter/material.dart';

Widget buttonSection = Container(
  margin: EdgeInsets.only(top: 20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.black12, Icons.call, 'Call'),
      _buildButtonColumn(Colors.pink[200], Icons.near_me, 'Nav'),
      _buildButtonColumn(Colors.pink[200], Icons.share_rounded, 'Share'),
    ],
  )
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color),
        ),
      )
    ],
  );
}
