
import 'package:ecommerce_app/Admin/Fruits/Freshvegetables.dart';
import 'package:ecommerce_app/Admin/Health/Energy.dart';
import 'package:ecommerce_app/Admin/Health/Healthdrinks.dart';
import 'package:ecommerce_app/Admin/Health/Tea.dart';
import 'package:ecommerce_app/Admin/Health/cof.dart';
import 'package:ecommerce_app/Admin/Health/fruitdrinks.dart';
import 'package:ecommerce_app/Admin/Health/water.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';


class health extends StatelessWidget {
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
              title: Text("Coffee"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => cof()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Energy & Soft drinks"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => energy()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Water"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => water()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Tea"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => tea()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Health Drink & Supplement"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => healthdrinks()));
              },
            ),
           
          ],
        ),
      ),
    );
  }
}
