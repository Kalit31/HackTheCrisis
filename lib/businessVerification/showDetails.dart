import 'package:flutter/material.dart';

class ShowBusinessDetails extends StatefulWidget {
  @override
  _ShowBusinessDetailsState createState() => _ShowBusinessDetailsState();
}

class _ShowBusinessDetailsState extends State<ShowBusinessDetails> {
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
                Text(
                  "My Business",
                  style: TextStyle(
                      color: Color(0xff4C46D3),
                      fontFamily: "Poppins",
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Color(0xffEFECEC),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "KAILA DEVI SAREE PVT. LTD.",
                            style: TextStyle(fontFamily: "Poppins"),
                          ),
                          Text(
                            "Surat, Gujarat",
                            style: TextStyle(
                                color: Color(0xffA6A6A6),
                                fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "ADDRESS",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xff4C46D3),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Text(
                              "17, Basement Abhishek Textile Market, Ring Road, Surat.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "REG DATE",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Color(0xff4C46D3),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "23 February 2016",
                            style: TextStyle(fontFamily: "Poppins"),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff4C46D3), width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Text(
                              "Activity",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Color(0xff4C46D3),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.arrow_back_ios,
                                color: Color(0xff4C46D3),
                              ),
                              Text(
                                "Manufacturing",
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff4C46D3),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                          )
                        ],
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff4C46D3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: Text(
                        "Report Damages",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Download Data",
                    style: TextStyle(
                      color: Color(0xff4C46D3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
