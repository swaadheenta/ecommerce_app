
import 'package:ecommerce_app/Categories/Bakery/Icecream.dart';
import 'package:ecommerce_app/Categories/Bakery/bread.dart';
import 'package:ecommerce_app/Categories/Bakery/cakes.dart';
import 'package:ecommerce_app/Categories/Bakery/dairy.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';


class bakery extends StatelessWidget {
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
              title: Text("Dairy"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dairy()));
              },
            ),
           
            Divider(),
            ListTile(
              title: Text("Breads & Buns"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => bread()));
              },
            ),
           
            Divider(),
            ListTile(
              title: Text("Icecreams & Desserts"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>Icecream() ));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Cakes & Pastries"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => cakes()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
