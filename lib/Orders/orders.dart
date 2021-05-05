import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';

class order {
  final String name;
  final String price;
  order({this.name, this.price});
}

class singlecard {
  String name;
  String price;
  singlecard({this.name, this.price});
}

class orders extends StatefulWidget {
  orders({Key key}) : super(key: key);

  @override
  _ordersState createState() => _ordersState();
}

class _ordersState extends State<orders> {
  @override
  Widget build(BuildContext context) {
    int len;
    var ans = "SAspWHg4BxfXk6w1tX4MHuZARBp2";

  

    Widget _showorders(BuildContext context, ds) {
      print(ds["name"]);
      List<dynamic> prod = ds["products"];
      ListView.builder(
        itemCount: ds["products"].length,
        itemBuilder: (BuildContext context, int index) {
          return Container();
        },
      );

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
                                      fontSize: displayWidth(context) * 0.045),
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
                                      icon: Icon(Icons.details_rounded),
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
                                  Stack(
                                    children: [
                                      Positioned(
                                          child: Container(
                                        height: displayHeight(context),
                                        width: displayWidth(context),
                                      )),
                                      Positioned(
                                        top: displayHeight(context) * 0.1,
                                        left: displayWidth(context) * 0.025,
                                        child: Container(
                                          height: displayHeight(context) * 0.75,
                                          width: displayWidth(context) * 0.95,
                                          child: ListView.builder(
                                              itemCount: prod.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return _showproducts(
                                                    context, prod[index]);
                                              }),
                                          // color: Colors.yellow,
                                        ),
                                      )
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      Positioned(
                                          child: Container(
                                        height: displayHeight(context),
                                        width: displayWidth(context),
                                      )),
                                      Positioned(
                                        top: displayHeight(context) * 0.1,
                                        left: displayWidth(context) * 0.025,
                                        child: Container(
                                          height: displayHeight(context) * 0.75,
                                          width: displayWidth(context) * 0.95,
                                          child: ListView.builder(
                                              itemCount: prod.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return _showproducts(
                                                    context, prod[index]);
                                              }),
                                          // color: Colors.yellow,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.only(top:2.0,left:15.0,right:15.0),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
              elevation: 10.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[200],
                ),
                height: displayHeight(context) * 0.1,
                width: displayWidth(context) * 0.6,
                child: Row(
                  children: [
                  SizedBox(
                    width: displayWidth(context)*0.05,
                  ),
                                      Icon(Icons.account_circle_sharp,size: displayWidth(context)*0.125,color: Colors.black54,),
                    SizedBox(
                    width: displayWidth(context)*0.1,
                  ),                  
                    Text(ds["name"],style: TextStyle(fontSize: displayWidth(context)*0.045,fontFamily: "Breeserif")),
                    SizedBox(
                    width: displayWidth(context)*0.245,
                  ),   
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Card(
                          elevation: 10.0,
                                                child: Container(
                            width: displayWidth(context)*0.15,
                            height: displayHeight(context)*0.8,
                            child: Center(child: Text(">",style: TextStyle(fontSize: displayWidth(context)*0.065),),)
                          ),
                      ),
                       ),
                    
                  ],
                )
              ),
            ),
          ),
        ),
      );
    }

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
           // left: displayWidth(context)*0.1,
            child: Container(
              height: displayHeight(context) * 0.82,
              //color: Colors.yellow,
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
