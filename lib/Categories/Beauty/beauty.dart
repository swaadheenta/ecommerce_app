
import 'package:ecommerce_app/Categories/Beauty/hair.dart';
import 'package:ecommerce_app/Categories/Beauty/makeup.dart';
import 'package:ecommerce_app/Categories/Beauty/oral.dart';
import 'package:ecommerce_app/Categories/Beauty/skin.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';

class beauty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop()),
        title: Text(
          "Subcategories",
          style: TextStyle(
              fontFamily: "Breeserif",
              fontSize: displayWidth(context) * 0.055,
              color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: ListView(
          children: <Widget>[
            
            ListTile(
              title: Text("Skin Care"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => skin()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Hair Care"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => hair()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Oral Care"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => oral()));
              },
            ),
            ListTile(
              title: Text("Makeup"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => makeup()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
