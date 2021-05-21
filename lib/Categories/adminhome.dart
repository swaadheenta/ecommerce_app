

import 'package:ecommerce_app/Categories/Bakery/bakery.dart';
import 'package:ecommerce_app/Categories/Beauty/beauty.dart';
import 'package:ecommerce_app/Categories/Cleaning/cleaning.dart';
import 'package:ecommerce_app/Categories/Foodgrains/foodgrains.dart';
import 'package:ecommerce_app/Categories/Fruits/Fruits.dart';
import 'package:ecommerce_app/Categories/Health/Health.dart';
import 'package:ecommerce_app/Categories/Kitchen/Kitchen.dart';
import 'package:ecommerce_app/Categories/Snacks/snacks.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'Babycare/Babycare.dart';
import 'package:flutter/material.dart';

class adminhome extends StatelessWidget {
  final tab = new TabBar(
    tabs: <Tab>[
      Tab(icon: Icon(Icons.home), text: "Home"),
      Tab(
        icon: Icon(Icons.dashboard),
        text: "Dashboard",
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Categories",
              style: TextStyle(
                fontFamily: "Breeserif",
                fontSize: displayWidth(context) * 0.055,
                color: Colors.white,
              ),
            ),
          ),
          body: Stack(
            children: [
              Positioned(
                  child: Container(
                height: displayHeight(context),
                width: displayWidth(context),
              )),
              Positioned(
                top: displayHeight(context) * 0.02,
                left: displayWidth(context) * 0.02,
                child: Container(
                  height: displayHeight(context) * 0.74,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => health()));
                        },
                        child: Container(
                            height: displayHeight(context) * 0.12,
                            width: displayWidth(context) * 0.96,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Positioned(
                                    left: displayWidth(context) * 0.02,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset("images/img1.jpg"),
                                      radius: displayWidth(context) * 0.1,
                                    )),
                                Positioned(
                                    left: displayWidth(context) * 0.3,
                                    child: Text(
                                      "Health Drinks & Beverages",
                                      style: TextStyle(
                                          fontFamily: "Breeserif",
                                          fontSize:
                                              displayWidth(context) * 0.045,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.8),
                                    )),
                              ]),
                            )),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.005,
                      ),
                      // To be changed later !!
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Kitchen()));
                        },
                        child: Container(
                            height: displayHeight(context) * 0.12,
                            width: displayWidth(context) * 0.96,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Positioned(
                                    left: displayWidth(context) * 0.02,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset("images/img14.jpeg"),
                                      radius: displayWidth(context) * 0.1,
                                    )),
                                Positioned(
                                    left: displayWidth(context) * 0.3,
                                    child: Text(
                                      "Kitchen Appliances",
                                      style: TextStyle(
                                        fontFamily: "Breeserif",
                                        fontSize: displayWidth(context) * 0.045,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    )),
                              ]),
                            )),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.005,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => foodgrains()));
                        },
                        child: Container(
                            height: displayHeight(context) * 0.12,
                            width: displayWidth(context) * 0.96,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Positioned(
                                    left: displayWidth(context) * 0.02,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset("images/img3.jpg"),
                                      radius: displayWidth(context) * 0.1,
                                    )),
                                Positioned(
                                    left: displayWidth(context) * 0.3,
                                    child: Text(
                                      "Foodgrains, Oils & Masala",
                                      style: TextStyle(
                                        fontFamily: "Breeserif",
                                        fontSize: displayWidth(context) * 0.045,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    )),
                              ]),
                            )),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.005,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => cleaning()));
                        },
                        child: Container(
                            height: displayHeight(context) * 0.12,
                            width: displayWidth(context) * 0.96,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Positioned(
                                    left: displayWidth(context) * 0.02,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset("images/img4.jpg"),
                                      radius: displayWidth(context) * 0.1,
                                    )),
                                Positioned(
                                    left: displayWidth(context) * 0.3,
                                    child: Text(
                                      "Cleaning & Household",
                                      style: TextStyle(
                                        fontFamily: "Breeserif",
                                        fontSize: displayWidth(context) * 0.045,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    )),
                              ]),
                            )),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.005,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => snacks()));
                        },
                        child: Container(
                            height: displayHeight(context) * 0.12,
                            width: displayWidth(context) * 0.96,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Positioned(
                                    left: displayWidth(context) * 0.02,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset("images/img5.jpg"),
                                      radius: displayWidth(context) * 0.1,
                                    )),
                                Positioned(
                                    left: displayWidth(context) * 0.3,
                                    child: Text("Snacks & Confectionery",
                                        style: TextStyle(
                                            fontFamily: "BreeSerif",
                                            fontSize:
                                                displayWidth(context) * 0.045,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 0.8))),
                              ]),
                            )),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.005,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => bakery()));
                        },
                        child: Container(
                            height: displayHeight(context) * 0.12,
                            width: displayWidth(context) * 0.96,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Positioned(
                                    left: displayWidth(context) * 0.02,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset("images/img6.jpg"),
                                      radius: displayWidth(context) * 0.1,
                                    )),
                                Positioned(
                                    left: displayWidth(context) * 0.3,
                                    child: Text(
                                      "Bakery & Dairy",
                                      style: TextStyle(
                                        fontFamily: "Breeserif",
                                        fontSize: displayWidth(context) * 0.045,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    )),
                              ]),
                            )),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.005,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => fnv()));
                        },
                        child: Container(
                            height: displayHeight(context) * 0.12,
                            width: displayWidth(context) * 0.96,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Positioned(
                                    left: displayWidth(context) * 0.02,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset("images/img7.jpg"),
                                      radius: displayWidth(context) * 0.1,
                                    )),
                                Positioned(
                                    left: displayWidth(context) * 0.3,
                                    child: Text(
                                      "Fruits & Vegetables",
                                      style: TextStyle(
                                        fontFamily: "Breeserif",
                                        fontSize: displayWidth(context) * 0.045,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    )),
                              ]),
                            )),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.005,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => beauty()));
                        },
                        child: Container(
                            height: displayHeight(context) * 0.12,
                            width: displayWidth(context) * 0.96,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Positioned(
                                    left: displayWidth(context) * 0.02,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset("images/img8.jpg"),
                                      radius: displayWidth(context) * 0.1,
                                    )),
                                Positioned(
                                    left: displayWidth(context) * 0.3,
                                    child: Text(
                                      "Beauty & Hygiene",
                                      style: TextStyle(
                                        fontFamily: "Breeserif",
                                        fontSize: displayWidth(context) * 0.045,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    )),
                              ]),
                            )),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.005,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => babycare()));
                        },
                        child: Container(
                            height: displayHeight(context) * 0.12,
                            width: displayWidth(context) * 0.96,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 10.0,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Positioned(
                                    left: displayWidth(context) * 0.02,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Image.asset("images/img9.jpg"),
                                      radius: displayWidth(context) * 0.1,
                                    )),
                                Positioned(
                                    left: displayWidth(context) * 0.3,
                                    child: Text(
                                      "Baby Care",
                                      style: TextStyle(
                                        fontFamily: "Breeserif",
                                        fontSize: displayWidth(context) * 0.045,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.8,
                                      ),
                                    )),
                              ]),
                            )),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
