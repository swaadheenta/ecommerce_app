
import 'package:ecommerce_app/Admin/Cleaning/Cars.dart';
import 'package:ecommerce_app/Admin/Cleaning/Detergents.dart';
import 'package:ecommerce_app/Admin/Cleaning/Freshners.dart';
import 'package:ecommerce_app/Admin/Cleaning/Mops.dart';
import 'package:ecommerce_app/Admin/Fruits/Freshvegetables.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';


class cleaning extends StatelessWidget {
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
              title: Text("Detergents & Dishwash"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Detergents()));
              },
            ),
           
            Divider(),
            ListTile(
              title: Text("Freshners & Repellents"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Freshners()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Mops,Brushes & Scrubs"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Mops()));
              },
            ),
            
            Divider(),
            ListTile(
              title: Text("Car & Shoe Care"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Car()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
