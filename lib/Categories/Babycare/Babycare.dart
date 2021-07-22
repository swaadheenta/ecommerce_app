
import 'package:ecommerce_app/Categories/Babycare/bath.dart';
import 'package:ecommerce_app/Categories/Babycare/food.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';

class babycare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop()),
        title: Text("Subcategories",style: TextStyle(fontFamily: "Breeserif",fontSize: displayWidth(context)*0.055,color: Colors.white),),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 29.9),
        child: ListView(
          children: <Widget>[
            ListTile(
              //  leading: Icon(Icons.add_circle_outline),
              title: Text("Baby Bath & Hygiene"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => bath()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Baby Food"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => food()));
              },
            ),
           
          ],
        ),
      ),
    );
  }
}
