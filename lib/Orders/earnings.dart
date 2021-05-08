import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class earnings extends StatefulWidget {
  earnings({Key key}) : super(key: key);

  @override
  _earningsState createState() => _earningsState();
}



class _earningsState extends State<earnings> {
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
      body: Center(
          child: Text(
        total.toString(),
        style: TextStyle(fontSize: displayWidth(context) * 0.045),
      )),
    );
  }
}
