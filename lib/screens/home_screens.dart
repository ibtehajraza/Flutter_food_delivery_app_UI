import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/rating_stars.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';

import '../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestorants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaurantScreen(restaurant: restaurant),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
              border: Border.all(
                width: 1.0,
                color: Colors.grey[200],
              ),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      image: AssetImage(restaurant.imageUrl),
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          restaurant.name,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        RatingStars(restaurant.rating),
                        Text(
                          restaurant.address,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          '0.2 miles away',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });

    return Column(
      children: restaurantList,
    );
  }

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
                    borderSide: BorderSide(
                        width: 0.8, color: Theme.of(context).primaryColor),
                  ),
                  hintText: 'Search Food or Restorants',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon:
                      IconButton(icon: Icon(Icons.clear), onPressed: () {})),
            ),
          ),
          RecentOrders(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Nearby Restorants',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5),
            ),
          ),
          _buildRestorants(),
        ],
      ),
    );
  }
}
