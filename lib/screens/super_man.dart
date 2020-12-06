import 'package:flutter/material.dart';

class SuperManScreen extends StatelessWidget {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Image.asset('assets/images/abe.jpg'),
                  ),
                  Expanded(
                    child: Image.network('https://www.nikkansports.com/entertainment/column/umeda/news/img/202008050000021-w500_0.jpg'),
                  )
              ]),
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
              )
            ]),
          ),
        ),
      )
    );
  }
}
