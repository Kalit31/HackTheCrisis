import 'package:hackthecause/auth/authController.dart';
import 'package:hackthecause/auth/views/login_page.dart';
import 'package:hackthecause/auth/views/phoneVerification.dart';
import 'package:hackthecause/auth/views/signUpStep1.dart';
import 'package:hackthecause/auth/views/signUpStep2.dart';
import 'package:hackthecause/auth/views/signUpStep3.dart';
import 'package:hackthecause/businessVerification/showDetails.dart';
import 'package:hackthecause/businessVerification/verificationController.dart';
import 'package:hackthecause/dashboard/dashboard.dart';
import 'package:hackthecause/dashboard/fund_details.dart';
import 'package:hackthecause/dashboard/main_dashboard.dart';
import 'package:hackthecause/general/reportLosses.dart';
import 'package:hackthecause/general/splashScreen.dart';
import 'package:hackthecause/guidelines/guidelines.dart';
import 'package:hackthecause/utils/support.dart';
import 'package:provider/provider.dart';
import 'package:sailor/sailor.dart';

import 'Verified.dart';

class Routes {
  static final sailor = Sailor(
    options: SailorOptions(
      handleNameNotFoundUI: true,
      isLoggingEnabled: true,
    ),
  );

  static void createRoutes() {
    sailor.addRoutes([
      SailorRoute(
        name: "/login",
        builder: (context, args, params) {
          return LoginPage();
        },
      ),
      SailorRoute(
        name: "/signUp1",
        builder: (context, args, params) {
          return SignUpStep1();
        },
      ),
      SailorRoute(
        name: "/signUp2",
        builder: (context, args, params) {
          return ChangeNotifierProvider(
            create: (context) => AuthController(),
            child: SignUpStep2(),
          );
        },
      ),
      SailorRoute(
        name: "/phoneVerify",
        builder: (context, args, params) {
          return ChangeNotifierProvider(
              create: (context) => AuthController(),
              child: PhoneVerification());
        },
      ),
      SailorRoute(
        name: "/signUp3",
        builder: (context, args, params) {
          return ChangeNotifierProvider(
              create: (context) => AuthController(), child: SignUpStep3());
        },
      ),
      SailorRoute(
        name: "/dashBoard",
        builder: (context, args, params) {
          return DashBoard();
        },
      ),
      SailorRoute(
          name: "/verified",
          builder: (context, args, params) {
            bool isApplicable = params.param<bool>('isApplicable');
            return VerifiedPage(
              isApplicable: isApplicable,
            );
          },
          params: [SailorParam<bool>(name: 'isApplicable')]),
      SailorRoute(
          name: "/funds",
          builder: (context, args, params) {
            return FundDetails();
          }),
      SailorRoute(
        name: "/guidelines",
        builder: (context, args, params) {
          return GuideLines(
            profilepage: false,
          );
        },
      ),
      SailorRoute(
        name: "/mainDashBoard",
        builder: (context, args, params) {
          return MainDashBoard();
        },
      ),
      SailorRoute(
        name: "/support",
        builder: (context, args, params) {
          return Support();
        },
      ),
      SailorRoute(
        name: "/splash",
        builder: (context, args, params) {
          return SplashScreen();
        },
      ),
      SailorRoute(
        name: "/reportLosses",
        builder: (context, args, params) {
          return ReportLosses();
        },
      ),
      SailorRoute(
        name: "/showBusinessDetails",
        builder: (context, args, params) {
          return ChangeNotifierProvider(
              create: (context) => VerificationController(),
              child: ShowBusinessDetails());
        },
      ),
    ]);
  }
}
