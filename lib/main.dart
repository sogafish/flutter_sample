import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import './widgets/button_section.dart';
import './widgets/human_images.dart';
void main() => runApp(SampleApp());
class SampleApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First',
      theme: new ThemeData(
        primarySwatch: Colors.pink,  //MaterialColor
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Title'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(children: [
              humanImages,
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: 'Super ', style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30)),
                        TextSpan(text: 'Man', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                      ],
                    ),
                  ),
                ),
              ),
              buttonSection,
            ]),
          ),
        ),
      )
    );
  }
}
