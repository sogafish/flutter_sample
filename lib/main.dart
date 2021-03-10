import 'package:flutter/material.dart';
import 'package:flutter_sample/widgets/fav_star.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import './widgets/button_section.dart';
import './widgets/human_images.dart';

import './widgets/gender_button.dart';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageWidget createState() => _MainPageWidget();
}
class _MainPageWidget extends State<MainPage> {
  int selectedGenderNum = 1;

  void onChangeGender(int value) {
    setState(() {
      selectedGenderNum = value;
    });
  }

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
              FavStarWedget(),
              Row(              
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GenderButton(
                    onChange: onChangeGender,
                    value: 1,
                    isSelected: selectedGenderNum == 1,
                  ),
                  GenderButton(
                    onChange: onChangeGender,
                    value: 2,
                    isSelected: selectedGenderNum == 2,
                  ),
                ],
              )
            ]),
          ),
        ),
      )
    );
  }
}
