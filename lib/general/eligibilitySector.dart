import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:hive/hive.dart';

class EligibilitySector extends StatefulWidget {
  @override
  _EligibilitySectorState createState() => _EligibilitySectorState();
}

class _EligibilitySectorState extends State<EligibilitySector> {
  String selectedSector = "";

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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                      'images/eligibilitySector.png',
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
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Sector",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff4C46D3),
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
                sectorWidget("Service Sector"),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
                sectorWidget("Manufacturing Sector"),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
                sectorWidget("Other"),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
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
                    if (selectedSector != "") {
                      final infoBox = await Hive.openBox('info');
                      infoBox.put('sector', selectedSector);
                      print(selectedSector);
                      if (selectedSector == "Other") {
                        Routes.sailor('/otherLosses');
                      } else {
                        Routes.sailor.navigate("/eliInvestment",
                            params: {'sector': selectedSector});
                      }
                    } else
                      Fluttertoast.showToast(
                          msg: "Please select a sector",
                          toastLength: Toast.LENGTH_SHORT);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sectorWidget(String sector) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSector = sector;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.075,
        decoration: BoxDecoration(
          border: Border.all(
              width: selectedSector == sector ? 3 : 1,
              color: selectedSector == sector ? Colors.green : Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Center(
          child: Text(
            sector,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: "Poppins",
            ),
          ),
        ),
      ),
    );
  }
}
