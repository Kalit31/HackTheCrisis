import 'package:flutter/material.dart';
import 'package:hackthecause/utils/Constants.dart';

class CustomTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final String value;

  const CustomTextWidget({Key key, this.value, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        keyboardType: value == "Enter Phone Number"
            ? TextInputType.number
            : TextInputType.text,
        decoration: InputDecoration(
            hintText: value,
            hintStyle: TextStyle(fontSize: 20, fontFamily: "Poppins")),
        controller: controller,
        showCursor: true,
        style: loginInputText,
      ),
      height: 30,
    );
  }
}
