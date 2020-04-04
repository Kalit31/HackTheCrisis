import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:hive/hive.dart';

class OtherInvestment extends StatefulWidget {
  @override
  _OtherInvestmentState createState() => _OtherInvestmentState();
}

class _OtherInvestmentState extends State<OtherInvestment> {
  String business = "";
  int investment = 0;
  int income = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(8, 32, 8, 16),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Divider(
                  height: 10,
                  color: Colors.transparent,
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
                Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Check", style: loginHeadingText),
                        Text("Eligibility", style: loginHeadingText),
                      ],
                    ),
                    Image.asset(
                      'images/eligibilityInvestment.png',
                      height: 200,
                      width: 200,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Divider(
                  height: 10,
                  color: Colors.transparent,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Type of Business",
                        hintStyle:
                            TextStyle(fontSize: 20, fontFamily: "Poppins")),
                    showCursor: true,
                    style: loginInputText,
                    onChanged: (text) {
                      setState(() {
                        business = text;
                      });
                    },
                  ),
                  height: 30,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter Investment",
                        hintStyle:
                            TextStyle(fontSize: 20, fontFamily: "Poppins")),
                    showCursor: true,
                    onChanged: (text) {
                      setState(() {
                        investment = int.parse(text);
                      });
                    },
                    style: loginInputText,
                  ),
                  height: 30,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter Annual Income",
                        hintStyle:
                            TextStyle(fontSize: 20, fontFamily: "Poppins")),
                    showCursor: true,
                    style: loginInputText,
                    onChanged: (text) {
                      setState(() {
                        income = int.parse(text);
                      });
                    },
                  ),
                  height: 30,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                GestureDetector(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.1),
                      decoration: loginButtonDecoration,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Center(
                        child: Text("Next", style: loginButtonText),
                      ),
                    ),
                  ),
                  onTap: () async {
                    if (business != "" && investment != 0 && income != 0) {
                      if (investment > 50000000) {
                        final infoBox = await Hive.openBox('info');
                        infoBox.put('investment', investment);
                        infoBox.put('income', income);
                        Routes.sailor.navigate("/verified",
                            params: {'isApplicable': false});
                      } else {
                        Routes.sailor.navigate("/verified",
                            params: {'isApplicable': true});
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please enter all the fields",
                          toastLength: Toast.LENGTH_SHORT);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
