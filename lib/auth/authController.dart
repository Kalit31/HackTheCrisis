import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

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

  Future<bool> signUpUser() async {
    final infoBox = await Hive.openBox('info');
    String name = await infoBox.get('name');
    String address = await infoBox.get('address');
    String state = await infoBox.get('state');
    String city = await infoBox.get('city');
    String email = await infoBox.get('email');
    String aadharNumber = await infoBox.get('aadharNumber');
    String gstNumber = await infoBox.get('gstNumber');
    String phoneNum = await infoBox.get('phoneNum');
    String password = await infoBox.get('password');

    try {
      var response = await http.post(
        'http://finhelp-api.herokuapp.com/register/signup/',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "name": name,
          "address": address,
          "state": state,
          "city": city,
          "email": email,
          "aadhar_no": int.parse(aadharNumber),
          "gstin": gstNumber,
          "mobile_number": int.parse(phoneNum),
        }),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        String idToken = json.decode(response.body)['idtoken'];
        print("ID TOKEN: " + idToken);
        await infoBox.put("idToken", idToken);
        var finalResponse = await http.post(
          'http://finhelp-api.herokuapp.com/register/set-password/',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'X-AUTH': idToken
          },
          body: jsonEncode(
              <String, String>{"password": password, "password1": password}),
        );
        print(finalResponse.body);
        if (finalResponse.statusCode == 200) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (err) {
      print("Error: " + err.toString());
      return false;
    }
  }
}
