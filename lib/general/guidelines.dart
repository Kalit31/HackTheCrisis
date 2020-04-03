import 'package:flutter/material.dart';
import 'package:hackthecause/general/documentGuidelines.dart';
import 'package:hackthecause/general/eligibilityGuidelines.dart';
import 'package:hackthecause/general/generalGuidelines.dart';
import 'package:hackthecause/utils/Constants.dart';

class GuideLines extends StatefulWidget {
  @override
  _GuideLinesState createState() => _GuideLinesState();
}

class _GuideLinesState extends State<GuideLines>
    with SingleTickerProviderStateMixin {
  int currentSelectedTab = 0;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: SafeArea(
            minimum: const EdgeInsets.fromLTRB(0, 0, 0, 16),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Divider(
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.transparent,
                    ),
                    Expanded(
                        flex: 2,
                        child: Text("Guidelines", style: loginHeadingText)),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: TabBar(
                          onTap: (index) {
                            currentSelectedTab = index;
                          },
                          controller: tabController,
                          labelColor: Color(0xff4C46D3),
                          unselectedLabelColor: Color(0xffBCBCBC),
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Color(0xff4C46D3),
                          isScrollable: true,
                          tabs: <Widget>[
                            Tab(
                              child: Text(
                                "General",
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Eligibility",
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Documents",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          Container(
                            child: GeneralGuidelines(),
                          ),
                          Container(
                            child: EligibilityGuidlines(),
                          ),
                          Container(
                            child: DocumentGuideLines(),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        child: GestureDetector(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.all(8),
                              margin: EdgeInsets.only(
                                  right:
                                      MediaQuery.of(context).size.width * 0.1,
                                  bottom: 20),
                              decoration: loginButtonDecoration,
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: Center(
                                child: Text("Next", style: loginButtonText),
                              ),
                            ),
                          ),
                          onTap: () async {},
                        ),
                      ),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.transparent,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
