
import 'package:ecommerce_app/Admin/Fruits/Freshvegetables.dart';
import 'package:ecommerce_app/Admin/Snacks/biscuits.dart';
import 'package:ecommerce_app/Admin/Snacks/namkeen.dart';
import 'package:ecommerce_app/Admin/Snacks/noodles.dart';
import 'package:ecommerce_app/Admin/Snacks/pickles.dart';
import 'package:ecommerce_app/Admin/Snacks/sauces.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';


class snacks extends StatelessWidget {
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
              title: Text("Chocolates & Biscuits"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => biscuits()));
              },
            ),
           
           
            Divider(),
            ListTile(
              title: Text("Spreads, Sauces & Ketchup"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sauces()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Snacks & Namkeen"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => namkeen()));
              },
            ),
             Divider(),
            ListTile(
              title: Text("Noodles, Pasta & Vermicilli"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => noodles()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Pickles & Chutneys"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => pickles()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
