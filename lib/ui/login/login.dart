import 'package:boiler_plate/constants/fontsize.dart';
import 'package:boiler_plate/controller/authcontroller.dart';
import 'package:boiler_plate/models/login.dart';
import 'package:boiler_plate/utils/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/textfiled.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

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
                    border: const OutlineInputBorder(),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorText: ispasswordValide == false
                        ? "passwordnote_valide".tr
                        : null,
                    labelText: 'Password',
                    hintText: 'password'.tr)),
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {},
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
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
                            onPressed: () {
                              loginAction();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        )
                      : const CircularProgressIndicator(),
                )),
            const SizedBox(
              height: 130,
            ),
            // const Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
