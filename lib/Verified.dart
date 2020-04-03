import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Routes.dart';

class VerifiedPage extends StatefulWidget {
  VerifiedPage({this.isApplicable});
  final bool isApplicable;
  @override
  _VerifiedPageState createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
  String imageAsset;
  String displayMessage;
  String subtitle;
  @override
  void initState() {
    if (widget.isApplicable) {
      imageAsset = "images/tick.png";
      displayMessage =
          "Your business is eligible for \n COVID-19 Financial compensations scheme";
      subtitle = "Please proceed to the dashboard now";
    } else {
      imageAsset = "images/cross.png";
      displayMessage =
          "Your business is not eligible for COVID-19 Financial compensations scheme";
      subtitle = "Only small businesses are eligible";
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              Center(
                  child: Image.asset(
                imageAsset,
                height: 200,
                width: 200,
              )),
              SizedBox(height: 15),
              Text(displayMessage ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 10,
              ),
              Text(subtitle ?? '',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600)),
              SizedBox(
                height: 20,
              ),
              widget.isApplicable
                  ? GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff4C46D3),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: Text(
                            "Proceed to Dashboard",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        Routes.sailor('/dashBoard');
                      },
                    )
                  : GestureDetector(
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xff4C46D3), blurRadius: 1)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                              child: Text(
                            "Check guidelines",
                            style: TextStyle(
                                color: Color(0xff4C46D3),
                                fontSize: 20,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold),
                          ))),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
