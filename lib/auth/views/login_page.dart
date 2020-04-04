import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Divider(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text("Welcome To FinHelp", style: welcomeText),
              Divider(
                height: 20,
                color: Colors.transparent,
              ),
              Image.asset(
                'images/login.png',
                height: 200,
                width: 200,
              ),
              Divider(
                height: 30,
                color: Colors.transparent,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 30,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                  ),
                  showCursor: true,
                  style: normalBlackStyle,
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 30,
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                  ),
                  showCursor: true,
                  style: normalBlackStyle,
                ),
              ),
              SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Text("Forgot Password?", style: linkTextStyle),
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.2),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                child: Container(
                  decoration: loginButtonDecoration,
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.popAndPushNamed(context, "/dashBoard");
                },
              ),
              SizedBox(height: 40),
              Text("Not registered?", style: linkTextStyle),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Routes.sailor('/signUp1');
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Color(0xff4C46D3), blurRadius: 1)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(
                        child: Text(
                      "Register",
                      style: TextStyle(
                          color: Color(0xff4C46D3),
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ))),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
