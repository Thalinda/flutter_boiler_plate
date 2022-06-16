import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:boiler_plate/constants/colors.dart';
import 'package:boiler_plate/widgets/textfiled1.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
  final TextEditingController forgotEmailcontroller = TextEditingController();
  final _forgotPasswordController = false;
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottomOpacity: 0,
          elevation: 0,
          leading: IconButton(
            tooltip: "Back",
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText("reset_pwd".tr,
                      style: TextStyle(
                          fontSize: 20.w, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  Wrap(children: [
                    AutoSizeText("email_instruction".tr,
                        style: TextStyle(
                            fontSize: 13.w,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54)),
                  ]),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            SizedBox(
              width: ScreenUtil().screenWidth / 0.9.r,
              child: textFiledEmail(
                widget.forgotEmailcontroller,
                InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 0.0),
                  ),
                  border: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        BorderSide(color: Colors.grey.shade600, width: 0.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(color: Colors.black, width: 0.0),
                  ),
                  filled: false,
                  fillColor: Colors.grey[200],
                  labelText: "email".tr,
                  labelStyle: TextStyle(
                      fontSize: 13.w,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                  hintText: "enter_email".tr,
                  hintStyle: TextStyle(
                      fontSize: 13.w,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.all(9.w),
              width: ScreenUtil().screenWidth / 0.9.r,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: SizedBox(
                  height: 50.h,
                  width: ScreenUtil().screenWidth / 0.9.r,
                  child: Obx(
                    () => widget._forgotPasswordController
                        ? Center(
                            child: SizedBox(
                              width: 50.w,
                              height: 100.h,
                              child: const CircularProgressIndicator(),
                            ),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.primarycolor),
                            onPressed: () {
                              print("Action button clicked");
                            },
                            child: Text(
                              'send_instruction'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                  )),
            )
          ],
        )));
  }
}
