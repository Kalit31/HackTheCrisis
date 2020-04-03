import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';

class SignUpStep1 extends StatefulWidget {
  @override
  _SignUpStep1State createState() => _SignUpStep1State();
}

class _SignUpStep1State extends State<SignUpStep1> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  String name = "";
  String address = "";
  String state = "";
  String city = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff4C46D3),
                    ),
                  ),
                ),
                Text("Sign Up", style: loginHeadingText),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.transparent,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter Name",
                    ),
                    controller: nameController,
                    showCursor: true,
                    style: loginInputText,
                  ),
                  height: 30,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter Address",
                    ),
                    showCursor: true,
                    controller: addressController,
                    style: loginInputText,
                  ),
                  height: 30,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter State",
                    ),
                    controller: stateController,
                    showCursor: true,
                    style: loginInputText,
                  ),
                  height: 30,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Enter City",
                    ),
                    controller: cityController,
                    showCursor: true,
                    style: loginInputText,
                  ),
                  height: 30,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                GestureDetector(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.2),
                      decoration: loginButtonDecoration,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Center(
                        child: Text("Next", style: loginButtonText),
                      ),
                    ),
                  ),
                  onTap: () {
                    name = nameController.text;
                    address = addressController.text;
                    state = stateController.text;
                    city = cityController.text;
                    if (name.isNotEmpty &&
                        address.isNotEmpty &&
                        state.isNotEmpty &&
                        city.isNotEmpty) {
                      Routes.sailor('/signUp2');
                    } else {
                      Fluttertoast.showToast(
                        msg: "Please enter all details",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
