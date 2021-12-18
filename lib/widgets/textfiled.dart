import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Padding textFiledEmail(
    TextEditingController email, InputDecoration inputDecoration) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
    //padding: EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      controller: email,
      obscureText: false,
      decoration: inputDecoration,
      keyboardType: TextInputType.emailAddress,
    ),
  );
}

Padding passwordTextFeild(
    TextEditingController editcontroller, InputDecoration inputDecoration) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
    // padding: EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      obscureText: true,
      decoration: inputDecoration,
      controller: editcontroller,
      keyboardType: TextInputType.visiblePassword,
    ),
  );
}
