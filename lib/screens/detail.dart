import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String humanName;

  DetailScreen({
    this.humanName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$humanName'),
          ],
        ),
      ),
    );
  }
}
