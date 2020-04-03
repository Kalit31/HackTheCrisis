import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hackthecause/auth/views/login_page.dart';
import 'package:hackthecause/auth/views/phoneVerification.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var arr = [LoginPage(), LoginPage(), PhoneVerification()];
  Widget selected;
  int selectedTab = 1;

  @override
  void initState() {
    selected=arr[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
        initialSelection: 1,
        tabs: [
          TabData(iconData: Icons.insert_drive_file, title: "Status"),
          TabData(iconData: Icons.cloud_upload, title: "Upload"),
          TabData(iconData: Icons.perm_identity, title: "Profile")
        ],
        onTabChangedListener: (position) {
          setState(() {
            selectedTab = position;
            selected = arr[selectedTab];
          });
        },
        barBackgroundColor: Colors.white,
        inactiveIconColor: Colors.grey,
        activeIconColor: Colors.white,
        circleColor: Color(0xff4C46D3),
        textColor: Color(0xff4C46D3),
      ),
      body: Container(child: selected),
    );
  }
}
