import 'package:klomi/helper/in_app_notification_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../helper/authentication_helper.dart';

class LoginPasswordAfterEmail extends StatefulWidget {
  const LoginPasswordAfterEmail({super.key, required this.email});
  final String email;
  @override
  State<LoginPasswordAfterEmail> createState() =>
      _LoginPasswordAfterEmailState();
}

class _LoginPasswordAfterEmailState extends State<LoginPasswordAfterEmail> {
  bool numbervalidated = false;
  bool isShowPassword = true;
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      // Navigate back

                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Log in'.tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.all(4),
                child: TextField(
                  controller: passwordController,
                  obscureText: isShowPassword,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password'.tr(),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: InkWell(
                            onTap: () {
                              isShowPassword = !isShowPassword;
                              setState(() {});
                            },
                            child: Text('show'.tr())),
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //continue button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      // Border
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(06.0),
                      )),
                      // numberValidated == false means the number is not validated and user cannot proceed
                      backgroundColor:
                          //  numbervalidated == false
                          //     ? MaterialStateProperty.all(Colors.grey)
                          //     :
                          MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                      // backgroundColor:
                      // MaterialStateProperty.all(const Color(0xFFC65201))
                    ),
                    onPressed: () {
                      AuthenticationHelper.login(
                          widget.email, passwordController.text, context);
                    },
                    child: Text(
                      'continue'.tr(),
                      style: const TextStyle(fontSize: 16, letterSpacing: 0.2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () async {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: widget.email);
                    debugPrint('reset password send');
                    if (mounted) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => ForgetPasswordBottomSheet(
                                email: widget.email,
                              ));
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'invalid-email') {
                      // Show an error message for an invalid email
                      InAppNotificationHelper.snackBarNotification(
                          context: context, message: 'Email is invalid'.tr());
                    } else if (e.code == 'user-not-found') {
                      InAppNotificationHelper.snackBarNotification(
                          context: context,
                          message: 'User not found for this email'.tr());

                      // Show an error message for a user not found
                    } else {
                      InAppNotificationHelper.snackBarNotification(
                          context: context, message: e.message ?? 'Error'.tr());
                    }
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
                child: Text(
                  'Forgotten password'.tr(),
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ForgetPasswordBottomSheet extends StatelessWidget {
  const ForgetPasswordBottomSheet({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                    color: Colors.green, shape: BoxShape.circle),
                child: const Icon(
                  Icons.check_sharp,
                  color: Colors.white,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Text(
                      'A link to reset your password has been set to'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'your email address'.tr(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.clear)),
            ],
          ),
        ),
      ],
    );
  }
}
