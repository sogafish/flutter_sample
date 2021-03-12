import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_sample/screens/my_list.dart';
import 'package:flutter_sample/widgets/fav_star.dart';
import 'package:flutter_sample/widgets/button_section.dart';
import 'package:flutter_sample/widgets/human_images.dart';
import 'package:flutter_sample/widgets/gender_button.dart';
import 'package:flutter_sample/screens/detail.dart';

void main() {
  runApp(
    Provider<String>.value(
      value: 'STRING',
      child: MaterialApp(
        home: MainPage(),
      ),
    ),
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
    var providedString = Provider.of<String>(context);

    return CupertinoApp(
      title: providedString,
      theme: new CupertinoThemeData(
      ),
      home: Scaffold(
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
