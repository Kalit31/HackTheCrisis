import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:hackthecause/utils/customTextWidget.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../authController.dart';

class SignUpStep3 extends StatefulWidget {
  @override
  _LoginStep3State createState() => _LoginStep3State();
}

class _LoginStep3State extends State<SignUpStep3> {
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  String password = "";
  String confirmPassword = "";

  @override
  void dispose() {
    passwordController.dispose();
    confirmPassController.dispose();
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                Text("Step 3 of 3", style: loginHeadingText),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.transparent,
                ),
                CustomTextWidget(
                  value: "Enter Password",
                  type: "T",
                  controller: passwordController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                CustomTextWidget(
                  value: "Confirm Password",
                  type: "T",
                  controller: confirmPassController,
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
                        child: Text("Submit", style: loginButtonText),
                      ),
                    ),
                  ),
                  onTap: () async {
                    final authController =
                        Provider.of<AuthController>(context, listen: false);

                    password = passwordController.text;
                    confirmPassword = confirmPassController.text;

                    if (password == confirmPassword) {
                      final infoBox = await Hive.openBox('info');
                      infoBox.put('password', password);
                      authController.setPassword().then((result) {
                        if (result) {
                          Fluttertoast.showToast(
                              msg: "User registered successfully",
                              toastLength: Toast.LENGTH_SHORT);
                          Routes.sailor('/guidelines');
                        } else {
                          Fluttertoast.showToast(
                              msg: "SignUp Failed.",
                              toastLength: Toast.LENGTH_SHORT);
                        }
                      }).catchError((err) {
                        Fluttertoast.showToast(
                            msg: "SignUp Failed.",
                            toastLength: Toast.LENGTH_SHORT);
                      });
                    } else {
                      Fluttertoast.showToast(
                        msg: "Passwords do not match",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text("Already have an account ? ", style: loginInputText),
                      GestureDetector(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color(0xff4C46D3),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context, '/login',
                              (Route<dynamic> route) => false);
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
