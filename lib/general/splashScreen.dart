import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff4C46D3),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    "Welcome to FinHelp.",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 32),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Text(
                      "Revive your pandemic hit business",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Image.asset('images/splash.png'),
                Divider(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                GestureDetector(
                  onTap: () async {
                    var info = await Hive.openBox('info');

                    if (info.get("state") != null) {
                      Navigator.popAndPushNamed(context, '/dashBoard');
                    } else
                      Navigator.popAndPushNamed(context, '/login');
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Color(0xff4C46D3), blurRadius: 1)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Center(
                          child: Text(
                        "Help your business",
                        style: TextStyle(
                            color: Color(0xff4C46D3),
                            fontSize: 20,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold),
                      ))),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ));
  }
}
