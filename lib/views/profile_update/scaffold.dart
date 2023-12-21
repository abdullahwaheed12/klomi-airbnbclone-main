import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/contstant/text_styles.dart';
import 'package:klomi/enums/gender.dart';
import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart' hide Trans;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../global_widgets/empty_space_widget.dart';
import '../../global_widgets/selectable_dropdown_global_widget.dart';
import 'logic.dart';
import 'widgets/profile_update_image_container.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  final List genderList = [
    'Male'.tr(),
    'Female'.tr(),
    'Other'.tr(),
  ];
  Gender? selectedGeder;
  var firstNameTEC = TextEditingController();
  var lastNameTEC = TextEditingController();
  var emailTEC = TextEditingController();
  var phoneNumberTEC = TextEditingController();
  var userModel = Get.find<GeneralGetxController>().currentUserModel!;
  var profileUpdateController = Get.put(ProfileUpdateLogic());

  @override
  void initState() {
    debugPrint('user $userModel');
    firstNameTEC.text = userModel.firstName;
    lastNameTEC.text = userModel.lastName;
    emailTEC.text = userModel.email;
    phoneNumberTEC.text = userModel.phoneNumber;
    selectedGeder = userModel.gender;
    initCountry();
    super.initState();
  }

  var loader = false;

  Country? _selectedCountry;

  bool isPhoneOtp = true;

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheet(
      context,
    );
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }

  bool numbervalidated = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final country = _selectedCountry;

    return ModalProgressHUD(
      inAsyncCall: loader,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: Text(
            'Edit personal info'.tr(),
            style: mediumTitle,
          ),
        ),
        body: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.035,
              right: width * 0.035,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //profile image

                  SizedBox(height: height * 0.03),
                  const ProfileUpdateImageContainer(),
                  const DynamicVerticalSpace(10),

                  const DynamicVerticalSpace(10),
                  RatingBar.builder(
                    initialRating: userModel.rattings.toDouble(),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),

                  const DynamicVerticalSpace(10),
                  Text(
                    '${userModel.rattingCount}(${userModel.rattings.toDouble().toPrecision(2)})',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const DynamicVerticalSpace(10),

                  TextField(
                    controller: firstNameTEC,
                    decoration: InputDecoration(
                      hintText: 'First name'.tr(),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextField(
                    controller: lastNameTEC,
                    decoration: InputDecoration(
                      hintText: 'Last name'.tr(),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SelectableDropDownGlobalWidget(
                      items: List.generate(
                        genderList.length,
                        (index) => DropdownMenuItem<String>(
                          onTap: () {
                            selectedGeder =
                                Gender.values.byName(genderList[index]);
                          },
                          value: genderList[index],
                          child: Text(
                            genderList[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black38,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      hintText: selectedGeder != null
                          ? selectedGeder!.name
                          : 'Gender'.tr()),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextField(
                    controller: emailTEC,
                    decoration: InputDecoration(
                      hintText: 'Email'.tr(),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  ///--- phone number
                  Container(
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
                            controller: phoneNumberTEC,
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

                  const Divider(
                    color: Colors.black12,
                  ),
                  if (userModel.idCardPhotoUrl == null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Government ID'.tr(),
                              style: const TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.001,
                            ),
                            Text(
                              'Not provided'.tr(),
                              style: const TextStyle(
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () async {
                            await profileUpdateController.picIdPhoto();
                            setState(() {});
                          },
                          style: TextButton.styleFrom(
                            visualDensity: VisualDensity.compact,
                          ),
                          child: Text(
                            profileUpdateController.idPhoto == null
                                ? 'Add'.tr()
                                : 'Picked',
                            style: const TextStyle(
                              color: Colors.black87,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // const Divider(
                  //   color: Colors.black12,
                  // ),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           'Emergency contact'.tr(),
                  //           style: const TextStyle(
                  //             color: Colors.black87,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     TextButton(
                  //       onPressed: () {},
                  //       style: TextButton.styleFrom(
                  //         visualDensity: VisualDensity.compact,
                  //       ),
                  //       child: Text(
                  //         'Add'.tr(),
                  //         style: const TextStyle(
                  //           color: Colors.black87,
                  //           decoration: TextDecoration.underline,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      loader = true;
                      setState(() {});
                      await profileUpdateController.updateProfile(
                          email: emailTEC.text,
                          firstName: firstNameTEC.text,
                          lastName: lastNameTEC.text,
                          gender: selectedGeder,
                          phoneNo: phoneNumberTEC.text);

                      loader = false;
                      setState(() {});
                      Get.back();
                    },
                    style: ButtonStyle(
                      minimumSize: const MaterialStatePropertyAll(
                          Size(double.infinity, 40)),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      'Save'.tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
