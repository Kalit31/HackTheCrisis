import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Routes.dart';

class WarningScreen extends StatefulWidget {
  WarningScreen({Key key}) : super(key: key);

  @override
  _WarningScreenState createState() => _WarningScreenState();
}

class _WarningScreenState extends State<WarningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Image.asset(
                'images/fake.png',
                height: 100,
                width: 100,
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Uploading forged documents\n can lead to serious\nlegal consequences.",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    color: Color(0xff4C46D3)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Kindly ensure the authenticity\n of documents before\n proceeding further.",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      color: Color(0xff4C46D3)),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                Routes.sailor('/dashBoard');
              },
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xff4C46D3)),
                width: 80,
                height: 40,
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Poppins"),
                  ),
                ),
              ),
            ),
          )
        ],
      ))),
    );
  }
}
