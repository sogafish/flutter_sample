import 'package:flutter/material.dart';
class HumanImages extends StatelessWidget {
  HumanImages({
    Key key,
    @required this.onSelect,
  }) : super(key: key);

  final ValueChanged<String> onSelect;

  void _handleTap(String humanName) {
    onSelect(humanName);
  }

  Expanded _buildImageContainer(String imgSrc, bool isNetwork, int id, String humanName) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _handleTap(humanName);
        },
        child: isNetwork ? Image.network(imgSrc) : Image.asset(imgSrc)
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildImageContainer('assets/images/abe.jpg', false, 1, '阿部寛'),
        _buildImageContainer('https://www.nikkansports.com/entertainment/column/umeda/news/img/202008050000021-w500_0.jpg', true, 2, '梅沢富美男'),
      ],
    );
  }
}
