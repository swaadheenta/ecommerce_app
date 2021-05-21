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

class healthdrinks extends StatefulWidget {
  @override
  _healthdrinksState createState() => _healthdrinksState();
}

class _healthdrinksState extends State<healthdrinks> {

String default_choice = 'Children(2-5 yrs)';
  int default_index = 0;
  List<category> categorylist = [
    category(
      name: 'Children(2-5 yrs)',
      index: 0,
    ),
    category(
      name: 'Kids(5+ yrs)',
      index: 1,
    ),
    category(
      name: 'Glucose Powder, Tablets',
      index: 2,
    ),
    category(
      name: 'Men & Women',
      index: 3,
    ),
  ];

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
         bottom: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.event_available_sharp),
                      text: "Add",
                    ),
                    Tab(
                      icon: Icon(Icons.event_busy),
                      text: "Delete",
                    ),
                  ],
                )),
            
        body: TabBarView(children: [
           SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
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
                        items: ['Children(2-5 yrs)', 'Kids(5+ yrs)','Glucose Powder, Tablets','Men & Women'].map(
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
                    height: displayHeight(context) * 0.02,
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
                    height: displayHeight(context) * 0.02,
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
      SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 10.0, right: 10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Select a category :-",
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.055,
                                  fontFamily: "BreeSerif",
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                              child: Column(
                                  children: categorylist
                                      .map((data) => RadioListTile(
                                            title: Text("${data.name}"),
                                            value: data.index,
                                            groupValue: default_index,
                                            onChanged: (value) {
                                              setState(() {
                                                default_choice = data.name;
                                                default_index = data.index;
                                              });
                                            },
                                          ))
                                      .toList())),
                          SizedBox(
                            height: displayHeight(context) * 0.02,
                          ),
                          Text(
                            "SubCategories :-",
                            style: TextStyle(
                                fontSize: displayWidth(context) * 0.055,
                                fontFamily: "BreeSerif",
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: displayWidth(context) * 0.1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection(default_choice)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<DropdownMenuItem> catlist = [];
                                    for (int i = 0;
                                        i < snapshot.data.docs.length;
                                        i++) {
                                      DocumentSnapshot ds =
                                          snapshot.data.docs[i];
                                      catlist.add(DropdownMenuItem(
                                        child: Text(ds.id),
                                        value: "${ds.id}",
                                      ));
                                    }
                                    return DropdownButton(
                                      items: catlist,
                                      isExpanded: false,
                                      hint: Text("Choose a subcategory"),
                                      onChanged: (val) {
                                        setState(() {
                                          categoryname = val;
                                          print(val);
                                        });
                                      },
                                      // value: categoryname
                                    );
                                  } else {
                                    return Container(
                                      height: displayHeight(context) * 0.0,
                                      width: displayWidth(context) * 0.0,
                                    );
                                  }
                                }),
                          ),
                          SizedBox(
                            height: displayHeight(context) * 0.035,
                          ),
                          Row(
                            children: [
                               SizedBox(
                                 width: displayWidth(context)*0.1,
                                ),
                             RaisedButton(
                                  onPressed: () {
                                    categoryname != null
                                        ? FirebaseFirestore.instance
                                            .collection(default_choice)
                                            .doc(categoryname)
                                            .update({"stock": false})
                                        : print("do nothing");
                                  },
                                  child: Text(
                                    "Out Of Stock",
                                    //style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                 width: displayWidth(context)*0.2,
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    categoryname != null
                                        ? FirebaseFirestore.instance
                                            .collection(default_choice)
                                            .doc(categoryname)
                                            .update({"stock": true})
                                        : print("do nothing");
                                  },
                                  child: Text(
                                    "In Stock",
                                    //style: TextStyle(color: Colors.white),
                                  ),
                                ),
                             
                            ],
                          )
                        ]),
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

