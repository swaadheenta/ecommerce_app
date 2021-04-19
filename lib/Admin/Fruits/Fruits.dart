
import 'package:ecommerce_app/Admin/Fruits/Freshfruits.dart';
import 'package:ecommerce_app/Admin/Fruits/Freshvegetables.dart';
import 'package:ecommerce_app/Admin/Fruits/sprouts.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';

class fnv extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop()),
        title: Text("Subcategories",style: TextStyle(fontFamily: "Breeserif",fontSize: displayWidth(context)*0.055,color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: ListView(
          children: <Widget>[
            ListTile(
              //  leading: Icon(Icons.add_circle_outline),
              title: Text("Fresh Vegetables"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => fv()));
              },
            ),
            
            Divider(),
            ListTile(
              // leading: Icon(Icons.add_circle),
              title: Text("Fresh Fruits"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ff()));
              },
            ),
         
            Divider(),
            ListTile(
              // leading: Icon(Icons.category),
              title: Text("Cuts & Sprouts"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sprouts()));
              },
            ),
            
          ],
        ),
      ),
    );
  }
}
