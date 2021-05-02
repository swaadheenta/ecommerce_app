
import 'package:ecommerce_app/Categories/Foodgrains/Atta.dart';
import 'package:ecommerce_app/Categories/Foodgrains/Dals.dart';
import 'package:ecommerce_app/Categories/Foodgrains/Rice.dart';
import 'package:ecommerce_app/Categories/Foodgrains/Salt.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';
import 'Oils.dart';

class foodgrains extends StatelessWidget {
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
              title: Text("Atta, Flours & Sooji"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Atta()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Dals & Pulses"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Dal()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Rice & Rice Products"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Rice()));
              },
            ),
            Divider(),
           
            ListTile(
              title: Text("Salt, Sugar & Jaggery"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Salt()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Edible Oils & Ghee"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Oil()));
              },
            ),
           
          ],
        ),
      ),
    );
  }
}
