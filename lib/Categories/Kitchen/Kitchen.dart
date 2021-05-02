

import 'package:ecommerce_app/Categories/Kitchen/accessories.dart';
import 'package:ecommerce_app/Categories/Kitchen/crockery.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';


class Kitchen extends StatelessWidget {
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
              title: Text("Crockery & Cutlery"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => crockery()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Kitchen Accessories"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => accessories()));
              },
            ),
           
          ],
        ),
      ),
    );
  }
}
