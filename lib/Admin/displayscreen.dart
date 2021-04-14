import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';

class Finalscreen extends StatefulWidget {
  Finalscreen({Key key}) : super(key: key);

  @override
  _FinalscreenState createState() => _FinalscreenState();
}

class _FinalscreenState extends State<Finalscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: displayHeight(context) * 0.1,
            left: displayWidth(context) * 0.05,
            child: Container(
                color: Colors.blue,
                height: displayHeight(context) * 0.8,
                width: displayWidth(context) * 0.9,
                child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection("A").snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return new ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.docs.length,
                          padding: const EdgeInsets.only(top: 15.0),
                          itemBuilder: (context, index) {
                            DocumentSnapshot ds = snapshot.data.docs[index];
                            return Card(
                              elevation: 10.0,
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          color: Colors.yellow,
                                          height: displayHeight(context)*0.3,
                                          width: displayWidth(context)*0.45,
                                          child: Image.network(ds['field5'],fit: BoxFit.fill,filterQuality: FilterQuality.high,)),
                                      ),
                                      Container(
                                        child: Text(ds['field1']),
                                      )
                                    ],
                                  )
                                ],
                              ) ,

                              );
                            
                          });
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}
