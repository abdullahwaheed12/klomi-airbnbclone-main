import 'package:klomi/helper/authentication_helper.dart';
import 'package:klomi/views/AllViews/all_views.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:country_calling_code_picker/picker.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  LogInState createState() => LogInState();
}

class LogInState extends State<LogIn> {
  Country? _selectedCountry;
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();
  bool isPhoneOtp = true;

  @override
  void initState() {
    initCountry();
    super.initState();
  }

  void initCountry() async {
    final country = await getCountryByCountryCode(context, 'FR');
    setState(() {
      _selectedCountry = country;
    });
  }

  void _onPressedShowBottomSheet() async {
    final country =
        await showCountryPickerSheet(context, cancelWidget: const SizedBox());
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  bool numbervalidated = false;
  @override
  Widget build(BuildContext context) {
    final country = _selectedCountry;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AllViews()));
                    },
                    child: const Icon(Icons.clear)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'log in or sign up to Klomi'.tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      letterSpacing: 0.6),
                ),
              ),
              if (isPhoneOtp)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              country == null
                                  ? Container()
                                  : Row(
                                      children: <Widget>[
                                        Image.asset(
                                          country.flag,
                                          package: countryCodePackageName,
                                          width: 32,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${country.callingCode} ${country.name} (${country.countryCode})',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                              GestureDetector(
                                  child: const Icon(
                                      Icons.keyboard_arrow_down_rounded),
                                  onTap: () {
                                    _onPressedShowBottomSheet();
                                  })
                            ],
                          ),
                        ),
                        Container(
                            color: Colors.black,
                            height: 1,
                            width: double.infinity),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextField(
                            onChanged: (value) {
                              if (value.length > 4) {
                                numbervalidated = true;
                                setState(() {});
                              } else {
                                setState(() {});
                              }
                            },
                            keyboardType: TextInputType.number,
                            controller: phoneNumberTextEditingController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'phone Number'.tr(),
                                hintStyle: const TextStyle(fontSize: 14),
                                isDense: true),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              if (isPhoneOtp)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "we'll text you to confirm your number, Standard message and data rates apply."
                        .tr(),
                    style: const TextStyle(
                        fontSize: 12, color: Colors.black, letterSpacing: 0.4),
                  ),
                ),
              if (!isPhoneOtp)
                const SizedBox(
                  height: 30,
                ),
              if (!isPhoneOtp)
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  margin: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: TextField(
                    onChanged: (value) {
                      if (value.length > 4) {
                        numbervalidated = true;
                        setState(() {});
                      } else {
                        setState(() {});
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: phoneNumberTextEditingController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email'.tr(),
                        hintStyle: const TextStyle(fontSize: 14),
                        isDense: true),
                  ),
                ),
              if (!isPhoneOtp)
                const SizedBox(
                  height: 10,
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
                      backgroundColor: numbervalidated == false
                          ? MaterialStateProperty.all(Colors.grey)
                          : MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                      // backgroundColor:
                      // MaterialStateProperty.all(const Color(0xFFC65201))
                    ),
                    onPressed: () {
                      if (isPhoneOtp) {
                        AuthenticationHelper.sendCode(
                            context: context,
                            phoneNumber: phoneNumberTextEditingController.text);
                      } else {
                        AuthenticationHelper.continueWithEmail(
                            phoneNumberTextEditingController.text);
                      }
                    },
                    child: Text(
                      'continue'.tr(),
                      style: const TextStyle(fontSize: 16, letterSpacing: 0.2),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                        width: 165,
                        child: Divider(thickness: 1, color: Colors.grey)),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'or'.tr(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xff707070),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const SizedBox(
                        width: 150,
                        child: Divider(
                          thickness: 1,
                          color: Color(0xff707070),
                        ))
                  ],
                ),
              ),
              if (isPhoneOtp)
                LoginButton(
                    icon: Icons.mail,
                    title: 'continue with Email'.tr(),
                    onTap: () {
                      isPhoneOtp = false;
                      setState(() {});
                    }),
              if (!isPhoneOtp)
                LoginButton(
                    icon: Icons.phone_android_outlined,
                    title: 'continue with Phone'.tr(),
                    onTap: () {
                      isPhoneOtp = true;
                      setState(() {});
                    }),
              LoginButton(
                  icon: FontAwesomeIcons.facebook,
                  title: 'continue with Facebook'.tr(),
                  onTap: () {
                    AuthenticationHelper.signInWithFacebook(context);
                  }),
              LoginButton(
                  icon: FontAwesomeIcons.google,
                  title: 'continue with Google'.tr(),
                  onTap: () {
                    AuthenticationHelper.signInWithGoogle(context);
                  }),
              LoginButton(
                  icon: FontAwesomeIcons.apple,
                  title: 'continue with Apple'.tr(),
                  onTap: () {
                    AuthenticationHelper.signInWithApple(context);
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});
  final String title;
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(
                    icon,
                    size: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(width: 72),
                Text(title),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
