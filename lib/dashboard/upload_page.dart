import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
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
  bool isProcessing = false;
  Future uploadImage(int index) async {
    setState(() {
      isProcessing = true;
    });
    final infoBox = await Hive.openBox("info");
    String idtoken = infoBox.get("idToken");
    Dio dio = new Dio();
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    String filename = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(image.path, filename: filename),
      "name": name[index]
    });
    dio.options.headers["X-AUTH"] = idtoken;
    var response = await dio.post(
        "http://finhelp-api.herokuapp.com/register/upload/",
        data: formData);

    if (response.statusCode == 200) {
      setState(() {
        isProcessing = false;
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
      Fluttertoast.showToast(
          msg: "Upload Successful.", toastLength: Toast.LENGTH_LONG);
    } else {
      setState(() {
        isProcessing = false;
      });
      Fluttertoast.showToast(
          msg: "Upload Failed.Please Try Again",
          toastLength: Toast.LENGTH_LONG);
    }
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
            child: Stack(
          children: <Widget>[
            Column(
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
                SizedBox(height: 25),
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
                                            margin: EdgeInsets.only(
                                                right: 8, top: 8),
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
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 20),
                                        child: Text(
                                          name[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20,
                                              fontFamily: "Poppins"),
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(
                                            bottom: 10, left: 10),
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
                                right:
                                    MediaQuery.of(context).size.width * 0.05),
                            height: 120,
                            decoration: BoxDecoration(
                                color: Color(0xffE9E9E9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          );
                        }),
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
            isProcessing
                ? Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.grey,),
                  )
                : SizedBox(),
          ],
        )),
      ),
    );
  }
}
