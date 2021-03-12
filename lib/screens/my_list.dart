import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_sample/contacts/apiClient.dart';

import '../widgets/webview_sheet.dart';

class ListItem {
  final int id;
  final String name;
  final String urlToImage; 

  ListItem({ this.id, this.name, this.urlToImage });

  factory ListItem.fromJson(Map<String,dynamic> json) {
    return ListItem(
      id: json['id'], 
      name: json['name'], 
      urlToImage: json['urlToImage'] ?? '',
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  _MyListScreen createState() => _MyListScreen();
}

class _MyListScreen extends State<MyListScreen> {
  // ignore: deprecated_member_use
  // List<ListItem> _list = List<ListItem>();
  List _list = [];

  @override
  void initState() {
    super.initState();
    this.fetchList();
  }

  Future<void> fetchList() async {
    var response = await apiClient.get('/');
    if (response['body'].length >= 1) {
      setState(() {
        _list = response['body'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListPage'),
      ),
      body: Container(
        child: _list.length >= 1 ? ListView.builder(
          itemCount: _list.length,
          itemBuilder: _buildListItems,
        ) : Text('Nothing to show'),
      ),
    );
  }

  ListTile _buildListItems(BuildContext context, int index) {
    var item = _list[index];
    print(item);
    return ListTile(
      contentPadding: EdgeInsets.only(top: 20, left: 10, right: 10),
      onTap: () => showCupertinoModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Container(
          child: WebViewSheet(pageUrl: item['pageUrl'], title: item['name']),
        ),
      ),
      subtitle: Row(
        children: [
          Image(
            image: NetworkImage(item['thumbnail']),
            fit: BoxFit.cover,
            height: 80,
            width: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(item['name'], style: TextStyle(fontSize: 18))
          ),
        ],
      ),
    );
  }
}
