import 'package:flutter/material.dart';

import 'package:task1/List.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}
class _CartState extends State<Cart> {
  List<Container> viewList=[];
  @override
  void initState() {
    cartLIst.forEach((element) {
      Container temp=Container(
        child: Row(
          children: <Widget>[
             CircleAvatar(
                maxRadius: 25,
                backgroundImage: AssetImage("img/smile.png"),
                backgroundColor: Colors.transparent,
              ),
              Container(
              margin: EdgeInsets.fromLTRB(10, 0, 50, 0),
              child: Text(element.substring(0,element.indexOf("|")),style: TextStyle(fontSize: 25),),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 0, 5, 0),
              child: Text((element.substring(element.indexOf("|")+1)+ 'EGP'),style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      );
      viewList.add(temp);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView(
        children: viewList,
      )
    );
  }
}