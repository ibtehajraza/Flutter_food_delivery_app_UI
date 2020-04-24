import 'package:flutter/material.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.supervisor_account),
            iconSize: 25.0,
            onPressed: () {}),
        title: Text('Food Delivery'),
        actions: <Widget>[
          FlatButton(
              onPressed: () {},
              child: Text(
                'Cart (${currentUser.cart.length})',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8,color: Theme.of(context).primaryColor),
                  ),
                  hintText: 'Search Food or Restorants',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon:
                      IconButton(icon: Icon(Icons.clear), onPressed: () {})),
            ),
          ),
        ],
      ),
    );
  }
}
