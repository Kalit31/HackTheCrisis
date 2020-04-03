import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackthecause/auth/authController.dart';
import 'package:hackthecause/auth/views/signUpStep3.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:provider/provider.dart';

class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  String codeSent = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    if (authController.verificationSuccessful == -1) {
      Fluttertoast.showToast(
          msg: "Verification Failed! Please try again.",
          toastLength: Toast.LENGTH_SHORT);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xff4C46D3),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text("Verification", style: loginHeadingText),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.transparent,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Enter the verification code we just sent you on your mobile number.",
                    style: loginTextInfo,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
                  child: PinEntryTextField(
                    fields: 6,
                    showFieldAsBox: false,
                    onSubmit: (String pin) {
                      setState(() {
                        codeSent = pin;
                      });
                    },
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
                        child: Text(
                            authController.verificationSuccessful == 1
                                ? "Next"
                                : "Verify",
                            style: loginButtonText),
                      ),
                    ),
                  ),
                  onTap: () async {
                    if (authController.verificationSuccessful == 1) {
                      Fluttertoast.showToast(
                          msg: "Verification Successful!",
                          toastLength: Toast.LENGTH_SHORT);
                      Routes.sailor('/signUp3');
                    } else {
                      authController.verifyCodeManually(codeSent);
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
