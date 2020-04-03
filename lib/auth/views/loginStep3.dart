import 'package:flutter/material.dart';

class LoginStep3 extends StatefulWidget {
  @override
  _LoginStep3State createState() => _LoginStep3State();
}

class _LoginStep3State extends State<LoginStep3> {
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
                  "Step 3 of 3",
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
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                    ),
                    showCursor: true,
                    style:
                        TextStyle(color: Colors.black, fontFamily: "Poppins"),
                  ),
                  height: 30,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                    ),
                    showCursor: true,
                    style:
                        TextStyle(color: Colors.black, fontFamily: "Poppins"),
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
                          "Submit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Poppins",
                          ),
                        ))),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Already have an account ? ",
                        style: TextStyle(
                            color: Colors.black, fontFamily: "Poppins"),
                      ),
                      GestureDetector(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Color(0xff4C46D3),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
                        ),
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
