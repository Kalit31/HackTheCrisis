import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Constants.dart';
import 'package:hackthecause/utils/Timeline.dart';

class MainDashBoard extends StatefulWidget {
  @override
  _MainDashBoardState createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
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
                Timeline(
                  children: <Widget>[
                    DashboardItem(
                      value: "Business is Eligible",
                      completed: true,
                    ),
                    DashboardItem(
                      value: "Documents Uploaded",
                      completed: false,
                    ),
                    DashboardItem(
                      value: "Submitted for review",
                      completed: false,
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
                      color: Colors.grey,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Colors.grey,
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
