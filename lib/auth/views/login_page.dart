import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:hive/hive.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController, passwordController;
  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  bool isprocessing = false;
  Future login() async {
    setState(() {
      isprocessing = true;
    });
    Dio dio = new Dio();

    var arr = {
      "username": phoneController.text,
      "password": passwordController.text
    };
    // dio.options.headers["X-AUTH"] = "0ac6859b-8fa9-4d7a-b24e-61e4a42b6079";
    var response = await dio
        .post("http://finhelp-api.herokuapp.com/register/signin/", data: arr);

    if (response.statusCode == 200) {
      print(response.data);
      
      var infoBox = await Hive.openBox("info");
      String gstNumber = response.data["gstin"];
      String city = response.data["city"];
      String address = response.data["address"];
      String state = response.data["state"];
      String aadharNumber = response.data["aadhar_no"].toString();
      String phoneNum = response.data["mobile_number"].toString();
      bool is_registered = response.data["is_registered"];
      String idToken = response.data["idtoken"];
      infoBox.put("gstNumber", gstNumber);
      infoBox.put("city", city);
      infoBox.put("state", state);
      infoBox.put("address", address);
      infoBox.put("aadharNumber", aadharNumber);
      infoBox.put("phoneNum", phoneNum);
      infoBox.put("is_registered", is_registered);
      infoBox.put("idToken", idToken);
      setState(() {
        isprocessing = false;
      });
      Routes.sailor("/guidelines");
    } else {
      setState(() {
        isprocessing = false;
        Fluttertoast.showToast(
            msg: "Login Failed", toastLength: Toast.LENGTH_LONG);
      });
    }
  }

  String phoneno, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
            child: Stack(
          children: <Widget>[
            Column(
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
                    controller: phoneController,
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
                    controller: passwordController,
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
                    phoneno = phoneController.text;
                    password = passwordController.text;
                    if (phoneno.length == 10 && password.isNotEmpty) {
                      login();
                    } else {
                      Fluttertoast.showToast(
                          fontSize: 16,
                          msg: "Please Check all details",
                          toastLength: Toast.LENGTH_SHORT);
                    }
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
            isprocessing
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                    ),
                  )
                : SizedBox()
          ],
        )),
      ),
    );
  }
}
