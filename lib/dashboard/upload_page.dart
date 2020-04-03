import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> status = ["False", "False", "False", "False"];

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  SharedPreferences sharedPreferences;
  Future getprefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getStringList("Status") != null) {
      setState(() {
        status = sharedPreferences.getStringList("Status");
      });
    }
  }

  var images = [
    "images/aadhar.png",
    "images/pan.png",
    "images/documents.png",
    "images/documents.png"
  ];

  var name = ["Aadhar Card", "Pan Card", "Investment Proof", "Income Proof"];

  Future uploadImage(int index) async {
    Dio dio = new Dio();
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    String filename = image.path.split('/').last;
    FormData formData = FormData.fromMap(
        {"file": await MultipartFile.fromFile(image.path, filename: filename)});
    setState(() {
      if (image != null) {
        if (sharedPreferences.getStringList("Status") != null) {
          status = sharedPreferences.getStringList("Status");
          status[index] = "True";
          sharedPreferences.setStringList("Status", status);
        } else {
          status[index] = "True";
          sharedPreferences.setStringList("Status", status);
        }
      }
    });
  }

  @override
  void initState() {
    getprefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "Upload Documents",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff4C46D3)),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                        margin: EdgeInsets.all(8),
                                        child: Image.asset(images[index])),
                                  ),
                                  status[index] == "False"
                                      ? GestureDetector(
                                          onTap: () {
                                            uploadImage(index);
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  right: 8, top: 8),
                                              width: 30,
                                              height: 30,
                                              child: Icon(
                                                Icons.cloud_upload,
                                                color: Color(0xff4C46D3),
                                              )),
                                        )
                                      : Container(
                                          margin:
                                              EdgeInsets.only(right: 8, top: 8),
                                          width: 30,
                                          height: 30,
                                          child: Icon(
                                            Icons.beenhere,
                                            color: Color(0xff4C46D3),
                                          )),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                                      child: Text(
                                        name[index],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Poppins"),
                                      )),
                                  Container(
                                      margin:
                                          EdgeInsets.only(bottom: 10, left: 5),
                                      width: 1,
                                      height: 40,
                                      color: Colors.black),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 20, left: 20),
                                    child: Text(
                                      "Mandatory",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: "Poppins",
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                          margin: EdgeInsets.only(
                              bottom: 20,
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05),
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color(0xffE9E9E9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
