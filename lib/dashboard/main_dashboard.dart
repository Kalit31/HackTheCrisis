import 'package:flutter/material.dart';
import 'package:hackthecause/dashboard/upload_page.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Timeline.dart';
import 'package:shared_preferences/shared_preferences.dart';

List completed = ["True", "True", "True", "True"];

class MainDashBoard extends StatefulWidget {
  @override
  _MainDashBoardState createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  bool documentsuploaded = false;
  bool review = false;
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    getprefs();
    super.initState();
  }

  Future getprefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getStringList("Status") != null) {
      setState(() {
        List status = sharedPreferences.getStringList("Status");
        if (status[1] == completed[1] &&
            status[0] == completed[0] &&
            status[2] == completed[2] &&
            status[3] == completed[3]) {
          print(status.length);
          documentsuploaded = true;
          review = true;
        } else
          print("false");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "DashBoard",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color(0xff4C46D3)),
                  ),
                ),
                Image.asset('images/dashboard.png',
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.8),
                Timeline(lineColor: review?Color(0xff4C46D3):Colors.grey,
                  children: <Widget>[
                    DashboardItem(
                      value: "Business is Eligible",
                      completed: true,
                    ),
                    DashboardItem(
                      value: "Documents Uploaded",
                      completed: documentsuploaded,
                    ),
                    DashboardItem(
                      value: "Submitted for review",
                      completed: review,
                    ),
                    DashboardItem(
                      value: "Funds Approved",
                      completed: false,
                    ),
                  ],
                  indicators: <Widget>[
                    Icon(Icons.check_circle, color: Color(0xff4C46D3)),
                    Icon(
                      Icons.check_circle,
                      color:
                          documentsuploaded ? Color(0xff4C46D3) : Colors.grey,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: review ? Color(0xff4C46D3) : Colors.grey,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String value;
  final bool completed;

  const DashboardItem({Key key, this.value, this.completed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height * 0.1,
      child: Text(
        value,
        style: TextStyle(
            fontSize: 30,
            fontFamily: "Poppins",
            color: completed ? Color(0xff4C46D3) : Colors.grey),
      ),
    );
  }
}
