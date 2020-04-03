import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Constants.dart';

class EligibilityInvestment extends StatefulWidget {
  final String sector;

  const EligibilityInvestment({Key key, this.sector}) : super(key: key);
  @override
  _EligibilityInvestmentState createState() => _EligibilityInvestmentState();
}

class _EligibilityInvestmentState extends State<EligibilityInvestment> {
  final sectorInvestmentMap = {
    "Service Sector": [50000, 200000],
    "Manufacturing Sector": [60000, 500000],
    "Other": [10000, 100000]
  };
  String selectedCategory;

  @override
  Widget build(BuildContext context) {
    String selectedSector = widget.sector;
    List<int> range = sectorInvestmentMap[selectedSector];

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
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Select Investment",
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
                sectorWidget("<" + '\u20B9' + range[0].toString()),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
                sectorWidget('\u20B9' +
                    range[0].toString() +
                    ' - ' +
                    '\u20B9' +
                    range[1].toString()),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
                sectorWidget(">" + '\u20B9' + range[1].toString()),
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
          selectedCategory = sector;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.075,
        decoration: BoxDecoration(
          border: Border.all(
              width: selectedCategory == sector ? 3 : 1,
              color: selectedCategory == sector ? Colors.green : Colors.black),
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
