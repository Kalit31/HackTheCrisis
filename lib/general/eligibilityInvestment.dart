import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:hive/hive.dart';

class EligibilityInvestment extends StatefulWidget {
  final String sector;

  const EligibilityInvestment({Key key, this.sector}) : super(key: key);
  @override
  _EligibilityInvestmentState createState() => _EligibilityInvestmentState();
}

class _EligibilityInvestmentState extends State<EligibilityInvestment> {
  final sectorInvestmentMap = {
    "Service Sector": [1000000, 20000000, 50000000],
    "Manufacturing Sector": [2500000, 50000000, 100000000],
    "Other": [100, 10000, 100000]
  };
  String selectedCategory;
  int selectedBox = -1;
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
                sectorWidget("<" + '\u20B9' + range[0].toString(), 0),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
                sectorWidget(
                    '\u20B9' +
                        range[0].toString() +
                        ' - ' +
                        '\u20B9' +
                        range[1].toString(),
                    1),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
                sectorWidget(
                    '\u20B9' +
                        range[1].toString() +
                        ' - ' +
                        '\u20B9' +
                        range[2].toString(),
                    2),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                  color: Colors.transparent,
                ),
                sectorWidget(">" + '\u20B9' + range[2].toString(), 3),
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
                    if (selectedBox >= 0 && selectedBox <= 2) {
                      final infoBox = await Hive.openBox('info');
                      infoBox.put('investmentIndex', selectedBox);
                      Routes.sailor('/reportLosses');
                    } else {
                      Routes.sailor.navigate("/verified",
                          params: {'isApplicable': false});
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

  Widget sectorWidget(String sector, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = sector;
          selectedBox = index;
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
