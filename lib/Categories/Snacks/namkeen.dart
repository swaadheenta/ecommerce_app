import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Helpers/Devicesize.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';


class category {
  int index;
  String name;
  category({this.index, this.name});
}

String categoryname;
class namkeen extends StatefulWidget {
  @override
  _namkeenState createState() => _namkeenState();
}

class _namkeenState extends State<namkeen> {
  TextEditingController SubCategoryname = new TextEditingController();
  TextEditingController SubCategoryoldprice = new TextEditingController();
  TextEditingController SubCategorynewprice = new TextEditingController();
  TextEditingController SubCategoryquantity = new TextEditingController();
  String Imgname;
  String Imgloc;
  String Categoryname;
  String imageLocation;
  String url;
  File img;
  var image;
  PickedFile _image;
  String dropdownValue = "Please select a category";
  var imgstring;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
          child: Scaffold(
        appBar: AppBar(
          title: Text("Enter the details"),
          backgroundColor: Colors.blue,
        ),
        body: TabBarView(children: [
             SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
            child: Container(
              child: Column(
                children: [
                  Card(
                    elevation: 7.0,
                    child: Container(
                      height: displayHeight(context) * 0.075,
                      width: displayWidth(context) * 0.95,
                      child: DropdownButton(
                        hint: dropdownValue == null
                            ? Text('Please select a category')
                            : Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  dropdownValue,
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: TextStyle(color: Colors.blue),
                        items: ["Chips", "Namkeen","Health corner"].map(
                          (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              dropdownValue = val;
                              Categoryname = val;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: SubCategoryname,
                    decoration: InputDecoration(
                      hintText: "Enter the name of subcategory",
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  TextFormField(
                    controller: SubCategoryquantity,
                    decoration: InputDecoration(
                      hintText: "Enter the quantity of subcateory",
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  TextFormField(
                    controller: SubCategoryoldprice,
                    decoration: InputDecoration(
                      hintText: "Enter the old price of subcategory",
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.05,
                  ),
                  TextFormField(
                    controller: SubCategorynewprice,
                    decoration: InputDecoration(
                      hintText: "Enter the new price of subcategory",
                    ),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.05,
                  ),
                 
                  ButtonTheme(
                    height: displayHeight(context) * 0.15,
                    minWidth: displayWidth(context) * 0.32,
                    child: OutlineButton(
                      borderSide: BorderSide(color: Colors.grey, width: 2.5),
                      onPressed: getImage,
                      child: (_image != null)
                          ? Image(
                              image: AssetImage(_image.path),
                              filterQuality: FilterQuality.high,
                            )
                          : Icon(Icons.add, size: 30.0), //
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Divider(),
                  ),
                  Text(
                    "Double tap on submit button",
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.05,
                  ),
                  FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        Map<String, dynamic> data = {
                          "name": SubCategoryname.text,
                          "quantity": SubCategoryquantity.text,
                          "oldprice": SubCategoryoldprice.text,
                          "newprice":SubCategorynewprice.text,
                          "imgname": Imgname,
                          "imgloc": Imgloc,
                        };

                        //FirebaseFirestore.instance.collection("test").add(data);
                        FirebaseFirestore.instance
                            .collection(Categoryname)
                            .doc(SubCategoryname.text)
                            .set(data);
                        // .collection(Categoryname.text)
                        // .doc()
                        //  .collection("Pulses")
                        //  .doc(SubCategoryname.text)
                        //  .set(data);
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ),
      
        ],)
     ),
    );
  }

  final imagePicker = ImagePicker();

  Future getImage() async {
    image = await imagePicker.getImage(
        source: ImageSource.gallery,
        maxHeight: 2000,
        maxWidth: 4000,
        imageQuality: 80);

    setState(() {
      _image = image;
    });
    img = File(image.path);
    // print(image.path);
    uploadImageToFirebase(img);
  }

  Future<void> uploadImageToFirebase(File img) async {
    try {
      //Make random name of the image !!
      int randomnumber = Random().nextInt(100000);
      imageLocation = "images/image${randomnumber}.jpg";
      final StorageReference storageReference =
          FirebaseStorage().ref().child(imageLocation);
      final StorageUploadTask uploadTask = storageReference.putFile(img);
      final StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      url = await taskSnapshot.ref.getDownloadURL().whenComplete(() async {
        print(imageLocation);
        _addimage(imageLocation);
      });

      _addimageurl(url);
    } catch (e) {
      print(e.message);
    }
  }

  void _addimage(String imageLocation) {
    Imgname = imageLocation;
  }

  void _addimageurl(String url) {
    Imgloc = url;
  }
}

