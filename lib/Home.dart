import 'package:flutter/material.dart';

import './Cart.dart';
import './List.dart';

class HomePage extends StatefulWidget {
  String userName;
  HomePage({this.userName});
  @override
  _HomePageState createState() => _HomePageState(userName: userName);
}



class _HomePageState extends State<HomePage> {
  String userName;
  _HomePageState({this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $userName"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: InkResponse(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ListView(
        children: productList,
      ),
    );
  }
}
