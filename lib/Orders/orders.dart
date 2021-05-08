import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';

class orders extends StatefulWidget {
  orders({Key key}) : super(key: key);

  @override
  _ordersState createState() => _ordersState();
}

class _ordersState extends State<orders> {
  @override
  Widget build(BuildContext context) {
    Widget _showorders(BuildContext context, doc) {
      print("showorders");
     
      if (doc["pending"] == true) {
        print("*");
        return Card(
          elevation: 10.0,
          child: Container(
            width: displayWidth(context) * 0.8,
            height: displayHeight(context) * 0.1,
            child: Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: displayWidth(context) * 0.15,
                ),
                SizedBox(
                  width: displayWidth(context) * 0.1,
                ),
                SizedBox(
                  width: displayWidth(context) * 0.45,
                  child: Text(doc["name"]),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      FirebaseFirestore.instance
                          .collection("Orders")
                          .doc(doc["id"])
                          .update({'pending': false});
                    });
                  },
                  child: Text("Completed"),
                )
              ],
            ),
          ),
        );
      } else {
        return Container(
          height: displayHeight(context) * 0.0,
          width: displayWidth(context) * 0.0,
        );
      }
    }

    Widget _showallorders(BuildContext context, doc) {
      print(doc["pending"]);
      if (doc["pending"] == false && doc["completed"] == false) {
        print("*");
        return Card(
          elevation: 10.0,
          child: Container(
            width: displayWidth(context) * 0.8,
            height: displayHeight(context) * 0.1,
            child: Row(
              children: [
                Icon(
                  Icons.account_circle,
                  size: displayWidth(context) * 0.15,
                ),
                SizedBox(
                  width: displayWidth(context) * 0.1,
                ),
                SizedBox(
                  width: displayWidth(context) * 0.6,
                  child: Text(doc["name"]),
                ),
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        FirebaseFirestore.instance
                            .collection("Orders")
                            .doc(doc["id"])
                            .delete();

                             FirebaseFirestore.instance
                            .collection("Users")
                            .doc(doc["id"]).delete();
                            
                      });
                    })
              ],
            ),
          ),
        );
      } else {
        return Container(
          height: displayHeight(context) * 0.0,
          width: displayWidth(context) * 0.0,
        );
      }
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.event_busy),
                text: "Pending",
              ),
              Tab(
                icon: Icon(Icons.event_available_sharp),
                text: "Completed",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                Positioned(
                    child: Container(
                  height: displayHeight(context),
                  width: displayWidth(context),
                )),
                Positioned(
                    top: displayHeight(context) * 0.02,
                    child: Container(
                        height: displayHeight(context) * 0.8,
                        width: displayWidth(context),
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Orders")
                              .snapshots(),
                          builder: (context, snapshots) {
                            return ListView.builder(
                              itemCount: snapshots.data.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _showorders(
                                    context, snapshots.data.docs[index]);
                              },
                            );
                          },
                        )))
              ],
            ),
            //  Text("Hello there"),
            Stack(
              children: [
                Positioned(
                    child: Container(
                  height: displayHeight(context),
                  width: displayWidth(context),
                )),
                Positioned(
                    top: displayHeight(context) * 0.02,
                    child: Container(
                        height: displayHeight(context) * 0.8,
                        width: displayWidth(context),
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Orders")
                              .snapshots(),
                          builder: (context, snapshots) {
                            if (snapshots.hasData) {
                              return ListView.builder(
                                itemCount: snapshots.data.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return _showallorders(
                                      context, snapshots.data.docs[index]);
                                },
                              );
                            } else {
                              Text("Check your internet connection");
                            }
                          },
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
