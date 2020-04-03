import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AuthController extends ChangeNotifier {
  String smsVerificationCode = "";
  int verificationSuccessful = 0;
  String verificationId = "";

  AuthController() {
    verifyPhone();
  }

  Future<void> verifyPhone() async {
    verificationSuccessful = 0;
    notifyListeners();
    final infoBox = await Hive.openBox('info');
    String phoneNum = "+91" + await infoBox.get('phoneNum');
    print("PHONE NUMBER: " + phoneNum);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNum,
      timeout: const Duration(seconds: 0),
      verificationCompleted: (AuthCredential credential) async {
        signInWithCredentials(credential);
      },
      verificationFailed: (AuthException exception) {
        print('${exception.message}');
        verificationSuccessful = -1;
        notifyListeners();
      },
      codeSent: (String verId, [int forceCodeResend]) {
        verificationId = verId;
        notifyListeners();
      },
      codeAutoRetrievalTimeout: null,
    );
  }

  Future<void> signInWithCredentials(AuthCredential credential) async {
    AuthResult result =
        await FirebaseAuth.instance.signInWithCredential(credential);
    FirebaseUser user = result.user;
    if (user != null) {
      verificationSuccessful = 1;
      notifyListeners();
    }
  }

  Future<void> verifyCodeManually(String code) async {
    AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: code);
    signInWithCredentials(credential);
  }
}
