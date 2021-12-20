import 'package:boiler_plate/controller/authcontroller.dart';
import 'package:boiler_plate/models/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../widgets/textfiled.dart';
import '../../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  LoginProvider loginprovidere = Get.put(LoginProvider());
  bool isEmailValide = true;
  bool ispasswordValide = true;

  loginAction() async {
    // print(email.text);
    // print(GetUtils.isEmail('thalinda@gmail.com'));
    if (GetUtils.isEmail(email.text)) {
      setState(() {
        isEmailValide = true;
      });
      setState(() {
        ispasswordValide = true;
      });
      if (email.text.isNotEmpty) {
        await loginprovidere.loginToAppProvider(LoginModel(
            userName: email.text, password: password.text, isMobile: true));
      } else {
        setState(() {
          ispasswordValide = false;
        });
      }
    } else {
      setState(() {
        isEmailValide = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/logo2.png')),
              ),
            ),
            textFiledEmail(
              email,
              InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  border: const OutlineInputBorder(),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorText:
                      isEmailValide == false ? "emailnot_valid".tr : null,
                  labelText: 'email'.tr,
                  hintText: 'email_address'.tr),
            ),
            passwordTextFeild(
                password,
                InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: AppColors.primarycolor,
                            style: BorderStyle.solid)),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorText: ispasswordValide == false
                        ? "passwordnote_valide".tr
                        : null,
                    labelText: 'password'.tr,
                    hintText: 'password'.tr)),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {},
              child: Text(
                'forgot_password'.tr,
                style: TextStyle(
                    color: AppColors.primarycolor,
                    fontSize: ScreenUtil().setSp(14)),
              ),
            ),
            Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                // ignore: deprecated_member_use
                child: Obx(
                  () => !loginprovidere.isLoading.value
                      ? SizedBox(
                          height: 50,
                          width: 250,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.primarycolor),
                            onPressed: () {
                              loginAction();
                            },
                            child: Text(
                              'login'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(24),
                              ),
                            ),
                          ),
                        )
                      : const CircularProgressIndicator(),
                )),
            const SizedBox(
              height: 130,
            ),
            // Text(
            //   'New User? Create Account',
            //   style: TextStyle(fontSize: ScreenUtil().setSp(11)),
            // )
          ],
        ),
      ),
    );
  }
}
