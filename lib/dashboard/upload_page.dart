import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:hive/hive.dart';
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

  var images = ["images/aadhar.png", "images/pan.png", "images/documents.png"];

  var name = ["Aadhar Card", "Pan Card", "Income Tax Returns"];
  bool isProcessing = false;
  Future uploadImage(int index) async {
    setState(() {
      isProcessing = true;
    });
    final infoBox = await Hive.openBox("info");
    String idToken = infoBox.get("idToken");
    print(idToken);
    for (int i = 0; i < infoBox.length; i++) {
      print(infoBox.getAt(i).toString() + ":" +infoBox.keyAt(i));
    }
    Dio dio = new Dio();
    File doc = await FilePicker.getFile(
        allowedExtensions: ['pdf'], type: FileType.custom);

    if (doc != null) {
      String filename = doc.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(doc.path, filename: filename),
        "name": name[index]
      });
      dio.options.headers["X-AUTH"] = idToken;
      try {
        var response = await dio.post(
            "http://finhelp-api.herokuapp.com/register/upload/",
            data: formData);

        if (response.statusCode == 200) {
          print(response.statusCode);
          print(response.data.toString());
          setState(() {
            isProcessing = false;
            if (doc != null) {
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
        } else if(response.statusMessage=="Document Already Exists"){
          setState(() {
            isProcessing = false;
              Fluttertoast.showToast(
              msg: "Upload Failed.Please Try Again",
              toastLength: Toast.LENGTH_LONG);
          });
        
        }
      } on DioError catch (e) {
        print(e.response.statusMessage);
        if(e.response.toString()=="Document Already Exists"){
          setState(() {
             if (sharedPreferences.getStringList("Status") != null) {
                status = sharedPreferences.getStringList("Status");
                status[index] = "True";
                sharedPreferences.setStringList("Status", status);
              } else {
                status[index] = "True";
                sharedPreferences.setStringList("Status", status);
              }
          });
             Fluttertoast.showToast(
              msg: "File already uploaded",
              toastLength: Toast.LENGTH_LONG);
        }
        else
           Fluttertoast.showToast(
              msg: "Upload Failed.Please Try Again",
              toastLength: Toast.LENGTH_LONG);
      }
    }
    setState(() {
      isProcessing=false;

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
                        itemCount: 3,
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
                                            fontSize: 18),
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
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                    ),
                  )
                : SizedBox(),
          ],
        )),
      ),
    );
  }
}
