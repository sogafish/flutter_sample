import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../modals/modal_scroll.dart';
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
    var url = Uri.http('localhost:3000', '/');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      var itemList = jsonResponse['body'];
      print(itemList.length);
      if (itemList.length >= 1) {
        setState(() {
          _list = itemList;
        });
      }
    } else {
      print('Request failed status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListPage'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
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
        onTap: () => showCupertinoModalBottomSheet(
          expand: false,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
            child: WebViewSheet(pageUrl: item['pageUrl'], title: item['name']),
            // child: NestedScrollModal(),
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
