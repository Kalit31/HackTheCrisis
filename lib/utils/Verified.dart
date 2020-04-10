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
  String title;
  String buttonText;
  @override
  void initState() {
    if (widget.isApplicable) {
      imageAsset = "images/warning.png";
      title = "Warning";
      displayMessage =
          "Inaccurate reporting of losses due to any reason is considered a criminal offence";
      subtitle = "Kindly recheck the details before proceeding further.";
      buttonText = "Submit";
    } else {
      imageAsset = "images/error.png";
      displayMessage =
          "Your business is not registered as a SME with the government records.";
      subtitle = "Check your details again";
      buttonText = "Edit Details";
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
              Text(title ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff4C46D3),
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 15),
              Text(displayMessage ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff4C46D3),
                    fontSize: 18,
                    fontFamily: "Poppins",
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                subtitle ?? '',
                style: TextStyle(
                  color: Color(0xff4C46D3),
                  fontSize: 18,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff4C46D3),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: Text(
                      buttonText,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      widget.isApplicable ? '/dashBoard' : '/businessDetails',
                      (Route<dynamic> route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
