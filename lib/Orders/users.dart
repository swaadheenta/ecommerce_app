import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';

class users extends StatefulWidget {
  users({Key key}) : super(key: key);

  @override
  _usersState createState() => _usersState();
}

class _usersState extends State<users> {
  @override
  var ans = 0;
  var length = 0;
  int total;
  String docname;
  bool pressed = false;
  Widget build(BuildContext context) {
  
    Future gettotal() async {
      QuerySnapshot ds =
          await FirebaseFirestore.instance.collection("Admin").get();
      setState(() {
        total = ds.docs[0]["total"];
      });
    }

    Widget finalprice(BuildContext context, doc) {
      String title = doc["Productname"];
      String qty = doc["Itemcount"].toString();

      return Card(
          elevation: 10.0,
          child: Container(
              height: displayHeight(context) * 0.15,
              width: displayWidth(context) * 0.8,
              child: Row(children: [
                Container(
                  height: displayHeight(context) * 0.125,
                  width: displayWidth(context) * 0.25,
                  child: Image.network(
                    doc["Image"],
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: displayWidth(context) * 0.02,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: displayHeight(context) * 0.065,
                    ),
                    Container(
                        width: displayWidth(context) * 0.35,
                        child: Text(doc['Productname'])),
                    SizedBox(
                      height: displayHeight(context) * 0.008,
                    ),
                    Container(
                        width: displayWidth(context) * 0.37,
                        child: Text("quantity:$qty")),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: displayHeight(context) * 0.055,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          SnackBar snackbar =
                              SnackBar(content: Text("$title confirmed !!"));
                          Scaffold.of(context).showSnackBar(snackbar);

                          /* FirebaseFirestore.instance
                              .collection("Users")
                              .doc(docname)
                              .collection("Products")
                              .doc(title)
                              .update({"confirm": true});*/

                          gettotal();
                          print(total);
                          print(doc["totalprice"].toString());
                          FirebaseFirestore.instance
                              .collection("Admin")
                              .doc("geIBRDPL0s05gf3BM6Fn")
                              .update({
                            "total": total + doc["totalprice"],
                           
                          });
                        });
                      },
                      child: Card(
                        color: Colors.green,
                        child: Container(
                          width: displayWidth(context) * 0.25,
                          height: displayHeight(context) * 0.045,
                          child: Center(
                            child: Text(
                              "Confirm",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ])));
    }

    Widget _showorders(BuildContext context, ds) {
      docname = ds["id"];

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DefaultTabController(
                            length: 2,
                            child: Scaffold(
                                appBar: AppBar(
                                  title: Text(
                                    ds["name"],
                                    style: TextStyle(
                                        fontSize:
                                            displayWidth(context) * 0.045),
                                  ),
                                  leading: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back_ios),
                                    iconSize: displayWidth(context) * 0.045,
                                  ),
                                  bottom: TabBar(
                                    tabs: [
                                      Tab(
                                        icon: Icon(Icons.description_rounded),
                                        text: "Details",
                                      ),
                                      Tab(
                                          icon: Icon(Icons.shopping_basket),
                                          text: "Products"),
                                    ],
                                  ),
                                ),
                                body: TabBarView(
                                  children: [
                                    // Details portion :-
                                    Column(children: [
                                      SizedBox(
                                          height:
                                              displayHeight(context) * 0.05),
                                      //Card displaying name !!
                                      Card(
                                        elevation: 10.0,
                                        child: Container(
                                          height:
                                              displayHeight(context) * 0.135,
                                          width: displayWidth(context) * 0.9,
                                          child: Stack(children: [
                                            Positioned(
                                                left: displayWidth(context) *
                                                    0.05,
                                                top: displayHeight(context) *
                                                    0.025,
                                                child: Text(
                                                  "Name :",
                                                  style: TextStyle(
                                                      fontSize: displayWidth(
                                                              context) *
                                                          0.045),
                                                )),
                                            Positioned(
                                                right: displayWidth(context) *
                                                    0.05,
                                                top: displayHeight(context) *
                                                    0.025,
                                                child: Text(
                                                  ds["name"],
                                                  style: TextStyle(
                                                      fontSize: displayWidth(
                                                              context) *
                                                          0.045),
                                                )),
                                          ]),
                                        ),
                                      ),
                                      Divider(),
                                      //Card displaying phoneno !!
                                      Card(
                                        elevation: 10.0,
                                        child: Container(
                                          height:
                                              displayHeight(context) * 0.135,
                                          width: displayWidth(context) * 0.9,
                                          child: Stack(children: [
                                            Positioned(
                                                left: displayWidth(context) *
                                                    0.05,
                                                top: displayHeight(context) *
                                                    0.025,
                                                child: Text(
                                                  "Phoneno :",
                                                  style: TextStyle(
                                                      fontSize: displayWidth(
                                                              context) *
                                                          0.045),
                                                )),
                                            Positioned(
                                                right: displayWidth(context) *
                                                    0.05,
                                                top: displayHeight(context) *
                                                    0.025,
                                                child: Text(
                                                  ds["phoneno"],
                                                  style: TextStyle(
                                                      fontSize: displayWidth(
                                                              context) *
                                                          0.045),
                                                )),
                                          ]),
                                        ),
                                      ),
                                      Divider(),

                                      //card displaying address !!
                                      Card(
                                          elevation: 10.0,
                                          child: Container(
                                              height: displayHeight(context) *
                                                  0.135,
                                              width:
                                                  displayWidth(context) * 0.9,
                                              child: Stack(children: [
                                                Positioned(
                                                    left:
                                                        displayWidth(context) *
                                                            0.05,
                                                    top:
                                                        displayHeight(context) *
                                                            0.025,
                                                    child: Text(
                                                      "Address:",
                                                      style: TextStyle(
                                                          fontSize:
                                                              displayWidth(
                                                                      context) *
                                                                  0.045),
                                                    )),
                                                Positioned(
                                                    right:
                                                        displayWidth(context) *
                                                            0.05,
                                                    top:
                                                        displayHeight(context) *
                                                            0.025,
                                                    child: Text(
                                                      ds["address"],
                                                      style: TextStyle(
                                                          fontSize:
                                                              displayWidth(
                                                                      context) *
                                                                  0.045),
                                                    )),
                                              ]))),

                                      // card displaying gender
                                      Divider(),

                                      //card displaying address !!
                                      Card(
                                        elevation: 10.0,
                                        child: Container(
                                          height:
                                              displayHeight(context) * 0.135,
                                          width: displayWidth(context) * 0.9,
                                          child: Stack(children: [
                                            Positioned(
                                                left: displayWidth(context) *
                                                    0.05,
                                                top: displayHeight(context) *
                                                    0.025,
                                                child: Text(
                                                  "Gender:",
                                                  style: TextStyle(
                                                      fontSize: displayWidth(
                                                              context) *
                                                          0.045),
                                                )),
                                            Positioned(
                                                right: displayWidth(context) *
                                                    0.05,
                                                top: displayHeight(context) *
                                                    0.025,
                                                child: Text(
                                                  ds["gender"],
                                                  style: TextStyle(
                                                      fontSize: displayWidth(
                                                              context) *
                                                          0.045),
                                                )),
                                          ]),
                                        ),
                                      ),
                                    ]),

                                    //Product details :-
                                    Stack(
                                      children: [
                                        Positioned(
                                            child: Container(
                                          height: displayHeight(context),
                                          width: displayWidth(context),
                                        )),
                                        Positioned(
                                          top: displayHeight(context) * 0.02,
                                          left: displayWidth(context) * 0.025,
                                          child: Container(
                                            height:
                                                displayHeight(context) * 0.75,
                                            width: displayWidth(context) * 0.95,
                                            child: StreamBuilder(
                                              stream: FirebaseFirestore.instance
                                                  .collection("Users")
                                                  .doc(docname)
                                                  .collection("Products")
                                                  .snapshots(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return ListView.builder(
                                                      itemCount: snapshot
                                                          .data.docs.length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return finalprice(
                                                          context,
                                                          snapshot
                                                              .data.docs[index],
                                                        );
                                                      });
                                                } else {
                                                  return Text(
                                                      "Please check your internet connection!!");
                                                }
                                              },
                                            ),
                                            // color: Colors.yellow,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          )));
            },
            child: Card(
              elevation: 10.0,
              child: Container(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20.0),
                    color: Colors.grey[100],
                  ),
                  height: displayHeight(context) * 0.1,
                  width: displayWidth(context) * 0.6,
                  child: Row(
                    children: [
                      SizedBox(
                        width: displayWidth(context) * 0.05,
                      ),
                      Icon(
                        Icons.account_circle_sharp,
                        size: displayWidth(context) * 0.125,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.1,
                      ),
                      SizedBox(
                        width: displayWidth(context) * 0.44,
                        child: Text(ds["name"],
                            style: TextStyle(
                                fontSize: displayWidth(context) * 0.045,
                                fontFamily: "Breeserif")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10.0,
                          child: Container(
                              width: displayWidth(context) * 0.15,
                              height: displayHeight(context) * 0.8,
                              child: Center(
                                child: Text(
                                  ">",
                                  style: TextStyle(
                                      fontSize: displayWidth(context) * 0.085),
                                ),
                              )),
                        ),
                      ),
                    ],
                  )),
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Stack(
        children: [
          Positioned(
              child: Container(
            height: displayHeight(context),
            width: displayWidth(context),
          )),

          // users name !!
          Positioned(
            top: displayHeight(context) * 0.02,
            child: Container(
              height: displayHeight(context) * 0.82,
              width: displayWidth(context),
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("Orders").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _showorders(
                              context, snapshot.data.docs[index]);
                        });
                  } else {
                    return Text("Please check your internet connection!!");
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _showproducts(BuildContext context, var element) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10.0,
        child: Container(
          //color: Colors.black,
          height: displayHeight(context) * 0.1,
          width: displayWidth(context),
          child: Column(
            children: [
              Text(element["name"]),
              Text(element["price"]),
            ],
          ),
        ),
      ),
    );
  }
}
