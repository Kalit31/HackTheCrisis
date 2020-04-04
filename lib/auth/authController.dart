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

  Future<void> signUpUser() async {
    final infoBox = await Hive.openBox('info');
    String name = await infoBox.get('name');
    String address = await infoBox.get('address');
    String state = await infoBox.get('name');
    String city = await infoBox.get('name');
    String email = await infoBox.get('name');
    String aadharNumber = await infoBox.get('name');
    String gstNumber = await infoBox.get('name');
    String phoneNum = await infoBox.get('phoneNum');
    String password = await infoBox.get('password');

    Map<String, String> body = {
      "name": name,
      "address": address,
      "state": state,
      "city": city,
      "email": email,
      "aadharNumber": aadharNumber,
      "gstNumber": gstNumber,
      "phoneNumber": phoneNum,
      "password": password
    };
  }
}

Future<void> loginUser() async {}
