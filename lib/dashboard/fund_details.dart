import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FundDetails extends StatefulWidget {
  @override
  _FundDetailsState createState() => _FundDetailsState();
}

class _FundDetailsState extends State<FundDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Rs 114000",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Funds Received",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      gradient: LinearGradient(colors: [
                        Color(0xff251DE1),
                        Color(0xff4C46D3),
                      ])),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: Text(
                      "Amount left to be credited",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Poppins",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Rs 10000",
                          style: TextStyle(
                              color: Color(0xff251DE1),
                              fontFamily: "Poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "   by 15 April 2020",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Poppins",
                              fontSize: 18,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
