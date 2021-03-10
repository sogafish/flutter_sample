import 'package:flutter/material.dart';

class FavStarWedget extends StatefulWidget {
  @override
  _FavStarWidgetState createState() => _FavStarWidgetState();
}

class _FavStarWidgetState extends State<FavStarWedget> {
  bool _isFaved = true;
  int _favCount = 41;

  void _toggleFav() {
    setState(() {
      if (_isFaved) {
        _favCount -= 1;
      } else {
        _favCount += 1;
      }

      _isFaved = !_isFaved;
    });
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFaved ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFav,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(child: Text('$_favCount'))
        )
      ],
    );
  }
}
