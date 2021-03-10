import 'package:flutter/material.dart';

class GenderButton extends StatelessWidget {
  GenderButton({
    Key key,
    this.isSelected: false,
    this.value: 1,
    @required this.onChange,
  }) : super(key: key);

  final bool isSelected;
  final int value;
  final ValueChanged<int> onChange;

  void _handleTap() {
    onChange(value);
  }

  Widget build(BuildContext context) {
    bool isMale = value == 1;
    Color activeColor = isMale ? Colors.blue : Colors.pink;
    Color applyColor = isSelected ? activeColor : Colors.black26;

    return GestureDetector(
      onTap: _handleTap,
      child: Column(
        children: [
          Icon(
            Icons.wc,
            color: applyColor,
            size: 40,
          ),
          Text(
            isMale ? 'Male' : 'Female',
            style: TextStyle(fontSize: 20, color: applyColor),
          )
        ],
      )
    );
  }
}

