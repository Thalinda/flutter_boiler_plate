import 'package:flutter/material.dart';

Padding textFiledEmail(
    TextEditingController email, InputDecoration inputDecoration,
    {Function(String)? onChanged,
    TextInputAction textInputAction = TextInputAction.next}) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 0),
   
    child: TextField(
      textInputAction: textInputAction,
      onSubmitted: onChanged,
      controller: email,
      obscureText: false,
      decoration: inputDecoration,
      keyboardType: TextInputType.emailAddress,
    ),
  );
}

Padding passwordField(TextEditingController controller, obscuring,
    InputDecoration inputDecoration,
    {Function(String)? onsubmitted,
    Function(String)? onchaged,
    TextInputAction textInputAction = TextInputAction.next}) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 0),
  
    child: TextField(
      onChanged: onchaged,
      textInputAction: textInputAction,
      onSubmitted: onsubmitted,
      controller: controller,
      obscureText: obscuring,
      decoration: inputDecoration,
      keyboardType: TextInputType.emailAddress,
    ),
  );
}

Padding textFeildkeyBoardCustom(TextEditingController email,
    TextInputType keyboarType, int maxLength, InputDecoration inputDecoration) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 0),
  
    child: TextField(
      maxLength: maxLength,
      controller: email,
      obscureText: false,
      decoration: inputDecoration,
      keyboardType: keyboarType,
    ),
  );
}

Padding passwordTextFeild(
    TextEditingController editcontroller, InputDecoration inputDecoration,
    {Function(String)? onSubmited,
    TextInputAction textInputAction = TextInputAction.next}) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 0),
   
    child: TextField(
      obscureText: true,
      textInputAction: textInputAction,
      onSubmitted: onSubmited,
      decoration: inputDecoration,
      controller: editcontroller,
      keyboardType: TextInputType.visiblePassword,
    ),
  );
}
