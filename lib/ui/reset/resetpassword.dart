import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:boiler_plate/constants/colors.dart';
import 'package:boiler_plate/controller/authcontroller.dart';
import 'package:boiler_plate/models/user.dart';
import 'package:boiler_plate/utils/routes.dart';
import 'package:boiler_plate/widgets/textfiled.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpasswrod = TextEditingController();
  bool newpwd = false;
  bool passworderror = false;
  bool confirmpassworderror = false;
  bool confirm = false;

  String? typeoferror;
  dynamic data = "";
  String oldpwd = "";
  String validationcode = "";
  UserModel? converted;
  bool tokenvalidationstate = false;
  final requestType = Get.arguments['request_type']
      as String; //1 = First time login //2 = Forgot password

  LoginProvider loginProvider = Get.find<LoginProvider>();

  @override
  void initState() {
    if (requestType == "1") {
      data = Get.arguments['data'];
      converted = UserModel.fromJson(Get.arguments['data']);
      oldpwd = Get.arguments['old_pwd'];
    } else {
      validationcode = Get.arguments['validation_code'];
    }
    super.initState();
  }

  bool passwordValidation(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@?#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  submitPasswords() async {
    if (password.text.length < 6) {
      setState(() {
        passworderror = true;
        typeoferror = 'password_length'.tr;
      });
    } else if (password.text != confirmpasswrod.text) {
      setState(() {
        confirmpassworderror = true;
        passworderror = true;
        typeoferror = 'password_notmatch'.tr;
      });
    } else if (!passwordValidation(password.text)) {
      setState(() {
        confirmpassworderror = true;
        passworderror = true;
        typeoferror = 'password_notvalide'.tr;
      });
    } else {
      if (requestType == "1") {
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottomOpacity: 0,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 24.h),
              child: Center(
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(
                      0 / 360), // convert to radians
                  child: Image.asset(
                    'assets/images/shield.png',
                    width: ScreenUtil().setWidth(200),
                    height: ScreenUtil().setHeight(200),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText("create_pwd".tr,
                      style: TextStyle(
                          fontSize: 20.w, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  Wrap(children: [
                    AutoSizeText("password_ad".tr,
                        style: TextStyle(
                            fontSize: 13.w,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54)),
                  ]),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
            Obx(
              () => loginProvider.validatingverificationCode.value
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        SizedBox(
                          width: ScreenUtil().screenWidth / 0.9.r,
                          child: passwordField(
                              password,
                              newpwd, //obsecuring
                              InputDecoration(
                                errorText: typeoferror,
                                enabledBorder: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade600, width: 0.0),
                                ),
                                border: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade600, width: 0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 0.0),
                                ),
                                filled: false,
                                suffixIcon: IconButton(
                                    icon: Icon(newpwd
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        newpwd = !newpwd;
                                      });
                                    }),
                                fillColor: Colors.grey[200],
                                labelText: "new_pwd".tr,
                                labelStyle: TextStyle(
                                    fontSize: 13.w,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54),
                                hintText: "new_pwd".tr,
                                hintStyle: TextStyle(
                                    fontSize: 13.w,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54),
                              ),
                              textInputAction: TextInputAction.done,
                              onchaged: (_) {
                            setState(() {
                              passworderror = false;
                              typeoferror = null;
                            });
                          }),
                        ),
                        SizedBox(
                          width: ScreenUtil().screenWidth / 0.9.r,
                          child: passwordField(
                              confirmpasswrod,
                              confirm, //obscuring
                              InputDecoration(
                                errorText: typeoferror,
                                enabledBorder: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade600, width: 0.0),
                                ),
                                border: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: Colors.grey.shade600, width: 0.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 0.0),
                                ),
                                filled: false,
                                suffixIcon: IconButton(
                                    icon: Icon(confirm
                                        ? Icons.remove_red_eye_outlined
                                        : Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        confirm = !confirm;
                                      });
                                    }),
                                fillColor: Colors.grey[200],
                                labelText: "confirm_pwd".tr,
                                labelStyle: TextStyle(
                                    fontSize: 13.w,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54),
                                hintText: "confirm_pwd".tr,
                                hintStyle: TextStyle(
                                    fontSize: 13.w,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54),
                              ),
                              textInputAction: TextInputAction.done,
                              onchaged: (_) {
                            setState(() {
                              confirmpassworderror = false;
                              passworderror = false;
                              typeoferror = null;
                            });
                          }),
                        ),
                        SizedBox(height: 30.h),
                        Obx(
                          () => loginProvider.ispasswordchanged.value == false
                              ? Container(
                                  padding: EdgeInsets.all(10.w),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: SizedBox(
                                      height: 50.h,
                                      width: ScreenUtil().screenWidth / 1.r,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: AppColors.primarycolor),
                                        onPressed: () {
                                          submitPasswords();
                                        },
                                        child: Text(
                                          'save_password'.tr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      )))
                              : const CircularProgressIndicator(),
                        )
                      ],
                    ),
            )
          ],
        )));
  }
}
