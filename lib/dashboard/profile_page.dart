import 'package:flutter/material.dart';
import 'package:hackthecause/guidelines/guidelines.dart';
import 'package:hackthecause/utils/Routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

SharedPreferences sharedPreferences;

class _ProfilePageState extends State<ProfilePage> {
  List arr = ["Guidelines", "Funds Recieved", "Edit Details"];
  List images = ["guidelines.png", "funds.png", "details.png"];
  List routes = ["/guidelines", "/funds", "/funds"];

  Future getprefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    getprefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(20),
                child: GestureDetector(
                    onTap: () {
                      List<String> status = [
                        "False",
                        "False",
                        "False",
                        "False"
                      ];
                      if (sharedPreferences.getStringList("Status") != null) {
                        sharedPreferences.setStringList("Status", status);
                      }
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "/login", (Route<dynamic> route) => false);
                    },
                    child: Image.asset("images/logout.png")),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(20),
                child: GestureDetector(
                    onTap: () {
                      Routes.sailor("/support");
                    },
                    child: Image.asset("images/help.png")),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 15),
                Center(
                  child: Text(
                    "Profile",
                    style: TextStyle(
                        color: Color(0xff4C46D3),
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 25),
                  ),
                ),
                SizedBox(height: 20),
                CircleAvatar(
                  child: Icon(
                    Icons.person_outline,
                    size: 80,
                  ),
                  radius: 60,
                  backgroundColor: Color(0xff4C46D3),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "AYUSH",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                    child: SingleChildScrollView(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          child: ListTile(
                            leading: Image.asset("images/" + images[index]),
                            title: Text(
                              arr[index],
                              style: TextStyle(
                                  fontFamily: "Poppins", fontSize: 20),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                if (index != 0) {
                                  Routes.sailor(routes[index]);
                                } else {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => new GuideLines(
                                            profilepage: true,
                                          )));
                                }
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        );
                      }),
                ))
              ],
            ),
          ],
        )),
      ),
    );
  }
}
