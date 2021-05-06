import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:ecommerce_app/Orders/orders.dart';
import 'package:ecommerce_app/Orders/users.dart';

import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              child: Container(
            height: displayHeight(context),
            width: displayWidth(context),
          )),
          Positioned(
              top: displayHeight(context) * 0.1,
              child: Container(
                height: displayHeight(context) * 0.8,
                width: displayWidth(context),
                // color: Colors.yellow,
                child: Column(
                  children: [
                    SizedBox(
                      height: displayHeight(context) * 0.1,
                    ),
                    Row(
                      children: [
                        Container(
                          width: displayWidth(context) * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => users()));
                          },
                          child: Card(
                            elevation: 10.0,
                            child: Container(
                              color: Colors.white,
                              height: displayHeight(context) * 0.215,
                              width: displayWidth(context) * 0.45,
                              child: Center(child: Text("No. of users")),
                            ),
                          ),
                        ),
                        Container(
                          width: displayWidth(context) * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => orders()));
                          },
                          child: Card(
                            elevation: 10.0,
                            child: Container(
                              color: Colors.white,
                              height: displayHeight(context) * 0.215,
                              width: displayWidth(context) * 0.45,
                              child: Center(child: Text("No of orders")),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.1,
                    ),
                    Row(
                      children: [
                        Container(
                          width: displayWidth(context) * 0.02,
                        ),
                        Card(
                          elevation: 10.0,
                          child: Container(
                            color: Colors.white,
                            height: displayHeight(context) * 0.215,
                            width: displayWidth(context) * 0.45,
                            child: Center(child: Text("No. of users")),
                          ),
                        ),
                        Container(
                          width: displayWidth(context) * 0.02,
                        ),
                        Card(
                          elevation: 10.0,
                          child: Container(
                            color: Colors.white,
                            height: displayHeight(context) * 0.215,
                            width: displayWidth(context) * 0.45,
                            child: Center(child: Text("Earnings")),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
