import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                ),
                Text(
                  "Verification",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff4C46D3),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.transparent,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Enter the verification code we just sent you on your mobile number.",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
                  child: PinEntryTextField(
                    fields: 6,
                    showFieldAsBox: false,
                    onSubmit: () {},
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
                        decoration: BoxDecoration(
                            color: Color(0xff4C46D3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Center(
                            child: Text(
                          "Verify",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Poppins",
                          ),
                        ))),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
