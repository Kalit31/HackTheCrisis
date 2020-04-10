import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:hackthecause/utils/customTextWidget.dart';
import 'package:hive/hive.dart';

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
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    stateController.dispose();
    cityController.dispose();
    super.dispose();
  }

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
                Divider(
                  color: Colors.transparent,
                  height: 10,
                ),
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
                CustomTextWidget(
                  value: "Enter name",
                  controller: nameController,
                  type: "T",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextWidget(
                  value: "Enter Address",
                  controller: addressController,
                  type: "T",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextWidget(
                  value: "Enter State",
                  controller: stateController,
                  type: "T",
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CustomTextWidget(
                  value: "Enter City",
                  controller: cityController,
                  type: "T",
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
                  onTap: () async {
                    name = nameController.text;
                    address = addressController.text;
                    state = stateController.text;
                    city = cityController.text;
                    if (name.isNotEmpty &&
                        address.isNotEmpty &&
                        state.isNotEmpty &&
                        city.isNotEmpty) {
                      final infoBox = await Hive.openBox('info');
                      infoBox.put('name', name);
                      infoBox.put('address', address);
                      infoBox.put('state', state);
                      infoBox.put('city', city);

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
