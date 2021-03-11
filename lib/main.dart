import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sample/screens/my_list.dart';
import 'package:flutter_sample/widgets/fav_star.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

import './widgets/button_section.dart';
import './widgets/human_images.dart';

import './widgets/gender_button.dart';

import './screens/detail.dart';

void main() {
  runApp(
    MaterialApp(home: MainPage()),
  );
}

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

  void moveScreen(String humanName) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailScreen(humanName: humanName))
    );
  }

  void goToList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyListScreen())
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First',
      theme: new ThemeData(
        primarySwatch: Colors.pink,  //MaterialColor
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('First Title'),
        // ),
        body: Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(children: [
              HumanImages(onSelect: moveScreen),
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
              ),
              GestureDetector(
                onTap: goToList,
                child: Text(
                  "To List Page",
                  style: TextStyle(fontSize: 30, color: Colors.cyanAccent),
                ),
              )
            ]),
          ),
        ),
      )
    );
  }
}
