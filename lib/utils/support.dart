import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Constants.dart';

import 'Routes.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Divider(
                  color: Colors.transparent,
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "What can we help you with?",
                    style: loginHeadingText,
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Color(0xff4C46D3),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "General",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Routes.sailor('/guidelines');
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Color(0xff4C46D3),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: EdgeInsets.all(8),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Eligibility",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Routes.sailor('/eliSector');
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
                Divider(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Contact Us",
                    style: loginHeadingText,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.phone,
                        size: 40,
                      ),
                    ),
                    Text(
                      "123456789",
                      style: TextStyle(fontSize: 25, fontFamily: "Poppins"),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.email,
                        size: 40,
                      ),
                    ),
                    Text(
                      "help@finhelp.com",
                      style: TextStyle(fontSize: 25, fontFamily: "Poppins"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
