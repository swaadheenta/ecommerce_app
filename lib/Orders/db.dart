import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:ecommerce_app/Orders/orders.dart';
import 'package:ecommerce_app/Orders/users.dart';
import 'package:flutter/material.dart';

class dashb extends StatefulWidget {
  dashb({Key key}) : super(key: key);

  @override
  _dashbState createState() => _dashbState();
}

class _dashbState extends State<dashb> {
  int total;
  @override
  Widget build(BuildContext context) {
    Future<int> gettotal() async {
      QuerySnapshot qs =
          await FirebaseFirestore.instance.collection("Admin").get();
      setState(() {
        total = qs.docs[0]["total"];
      });
    }

    gettotal();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: displayHeight(context) * 0.15,
            left: displayWidth(context) * 0.35,
            child: Column(
              children: [
                Text(
                  "Total Earnings :-",
                  style: TextStyle(
                      fontSize: displayWidth(context) * 0.055,
                      fontFamily: "BreeSerif"),
                ),
                SizedBox(
                  height: displayHeight(context) * 0.005,
                ),
                Text(
                  "RS ${total.toString()}",
                  style: TextStyle(
                      fontSize: displayWidth(context) * 0.055,
                      color: Colors.red,
                      fontFamily: "BreeSerif"),
                ),
              ],
            ),
          ),
          Positioned(
            top: displayHeight(context) * 0.3,
            left: displayWidth(context) * 0.05,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => users()));
              },
              child: Card(
                elevation: 10.0,
                child: Container(
                  height: displayHeight(context) * 0.2,
                  width: displayWidth(context) * 0.9,
                  child: Row(
                    children: [
                      SizedBox(
                        width: displayWidth(context) * 0.05,
                      ),
                      CircleAvatar(
                        radius: displayWidth(context) * 0.15,
                        backgroundColor: Colors.lightBlue[300],
                        child: Image(
                          image: AssetImage(
                            "images/user.jpg",
                          ),
                          //height: displayHeight(context)*0.2,
                          width: displayWidth(context) * 0.2,
                        ),
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.1,
                      ),
                      Center(
                          child: Text(
                        "No of users",
                        style: TextStyle(
                            fontSize: displayWidth(context) * 0.055,
                            fontFamily: "BreeSerif"),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: displayHeight(context) * 0.6,
            left: displayWidth(context) * 0.05,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => orders()));
              },
              child: Card(
                elevation: 10.0,
                child: Container(
                  height: displayHeight(context) * 0.2,
                  width: displayWidth(context) * 0.9,
                  child: Row(
                    children: [
                      SizedBox(
                        width: displayWidth(context) * 0.05,
                      ),
                      CircleAvatar(
                        radius: displayWidth(context) * 0.15,
                        backgroundColor: Colors.lightBlue[300],
                        child: Image(
                          image: AssetImage(
                            "images/order.jpg",
                          ),
                          //height: displayHeight(context)*0.2,
                          width: displayWidth(context) * 0.17,
                        ),
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.1,
                      ),
                      Center(
                          child: Text(
                        "No of orders",
                        style: TextStyle(
                            fontSize: displayWidth(context) * 0.055,
                            fontFamily: "BreeSerif"),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
