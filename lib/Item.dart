import 'package:flutter/material.dart';

import 'package:task1/List.dart';
import './Cart.dart';

class Item extends StatefulWidget {
  String name;
  double price;
  Icon icon = Icon(Icons.add_shopping_cart);
  Function onPress;
  bool inCart = false;
  Item({this.name, this.price, this.onPress});
  @override
  _ItemState createState() => _ItemState(
      name: name, price: price, icon: icon, onPress: onPress, inCart: inCart);
}

class _ItemState extends State<Item> {
  String name;
  double price;
  Icon icon;
  Function onPress;
  bool inCart;
  _ItemState({this.name, this.price, this.icon, this.onPress, this.inCart});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 70,
        child: Row(
          children: <Widget>[
            CircleAvatar(
                maxRadius: 25,
                backgroundImage: AssetImage("img/smile.png"),
                backgroundColor: Colors.transparent,
              ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(name,style: TextStyle(fontSize: 25),),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: Text((price.toString() + 'EGP'),style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Container(
              child: IconButton(
                  icon: icon,
                  onPressed: () {
                    if (!inCart) {
                      setState(() {
                        icon = Icon(Icons.remove_shopping_cart);
                        cartLIst.add(this.name+"|"+price.toString());
                      });
                      inCart=true;
                    } else {
                      setState(() {
                        icon = Icon(Icons.add_shopping_cart);
                        cartLIst.remove(this.name+"|"+price.toString());
                        if(Navigator.canPop(context))
                          Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => Cart()));
                      });
                      inCart=false;
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
