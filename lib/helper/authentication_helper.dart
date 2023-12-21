// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:klomi/contstant/firebsae_keys.dart';
import 'package:klomi/models/host_setting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart'
    hide AuthorizationStatus;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart' hide Trans;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

import 'package:klomi/controllers/authentication_controller.dart';
import 'package:klomi/helper/in_app_notification_helper.dart';
import 'package:klomi/models/user.dart';
import 'package:klomi/views/allViews/all_views.dart';
import 'package:klomi/views/login/confirm_number_screen.dart';
import 'package:klomi/views/login/login_email_password.dart';
import 'package:klomi/views/add_your_info/add_your_info.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

import '../controllers/general_controller.dart';

class AuthenticationHelper {
  //check user exists
  static Future checkUserExist(String uid) async {
    final db = FirebaseFirestore.instance.collection("users");
    DocumentSnapshot docSnap = await db.doc(uid).get();
    if (docSnap.exists) {
      return true;
    } else {
      return false;
    }
  }

  static final FirebaseAuth auth = FirebaseAuth.instance;
//-------------
  //sign in with google
  static Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // handling the exception when cancel sign in
    if (googleUser == null) return null;

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    bool userCheck = await checkUserExist(auth.currentUser!.uid);
    if (!userCheck) {
      final user = auth.currentUser!;

      final db = FirebaseFirestore.instance.collection("users");
      String uid = auth.currentUser!.uid;
      var messagingToken = await FirebaseMessaging.instance.getToken();
      var userData = UserModel(
          rattingCount: 0,
          rattings: 0.0,
          hostSettings: HostSettings(
              isInstantBook: false,
              shouldIdentityVerification: false,
              shouldGoodTrackRecord: false),
          messagingToken: messagingToken ?? '',
          uid: uid,
          fullName: user.displayName ?? '',
          imageUrl: user.photoURL ?? 'empty',
          phoneNumber: user.phoneNumber ?? '',
          firstName: user.displayName ?? '',
          lastName: user.displayName ?? '',
          DOB: DateTime.now(),
          email: user.email ?? '');
      try {
        await db.doc(uid).set(userData.toMap());
        Get.to(
          () => AddYourInfo(
            imageUrl: user.photoURL ?? '',
            userId: user.uid,
            userPhoneNumber: user.phoneNumber ?? '',
            userEmail: user.email ?? '',
            isFromSocialMedia: true,
          ),
        );
        //return 'success';
      } on FirebaseAuthException catch (exc) {
        InAppNotificationHelper.snackBarNotification(
            context: context,
            message: exc.message ?? 'Some error in storing your data'.tr());
      } on FirebaseException catch (exc) {
        InAppNotificationHelper.snackBarNotification(
            context: context,
            message: exc.message ?? 'Some error in storing your data'.tr());
      } catch (e) {
        debugPrint('error: ${e.toString()}');
        InAppNotificationHelper.snackBarNotification(
            context: context, message: 'Some error in storing your data'.tr());
      }
    } else {
      Get.find<GeneralGetxController>().updateUserToken();
      Get.to(() => const AllViews());
    }
    return null;
  }

//-------------
  //sign in with facebook
  static Future<UserCredential?> signInWithFacebook(
      BuildContext context) async {
    // Trigger the sign-in flow

    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (exc) {
      InAppNotificationHelper.snackBarNotification(
          context: context,
          message: exc.message ?? 'Some error in storing your data'.tr());
    } on FirebaseException catch (exc) {
      InAppNotificationHelper.snackBarNotification(
          context: context,
          message: exc.message ?? 'Some error in storing your data'.tr());
    } catch (e) {
      debugPrint('error: ${e.toString()}');
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'Some error in storing your data'.tr());
    }
    bool userCheck = await checkUserExist(auth.currentUser!.uid);

    if (!userCheck) {
      try {
        final user = auth.currentUser;

        final db = FirebaseFirestore.instance.collection("users");
        String uid = auth.currentUser!.uid;
        var messagingToken = await FirebaseMessaging.instance.getToken();

        UserModel userdata = UserModel(
          rattingCount: 0,
          rattings: 0.0,
          hostSettings: HostSettings(
              isInstantBook: false,
              shouldIdentityVerification: false,
              shouldGoodTrackRecord: false),
          messagingToken: messagingToken ?? '',
          fullName: user!.displayName.toString(),
          uid: uid,
          imageUrl: user.photoURL ?? '',
          email: user.email.toString(),
          firstName: user.displayName.toString(),
          lastName: user.displayName.toString(),
          phoneNumber: user.phoneNumber.toString(),
          DOB: DateTime.now(),
        );
        await db.doc(uid).set(userdata.toMap());
        var token = await FirebaseMessaging.instance.getToken();
        FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'token': token}).then((value) {
          debugPrint('update token $token');
        });
        Get.to(
          () => AddYourInfo(
            imageUrl: user.photoURL ?? '',
            userId: user.uid,
            userPhoneNumber: user.phoneNumber ?? '',
            userEmail: user.email ?? '',
            isFromSocialMedia: true,
          ),
        );
        //return 'success';
      } on FirebaseAuthException catch (exc) {
        InAppNotificationHelper.snackBarNotification(
            context: context,
            message: exc.message ?? 'Some error in storing your data'.tr());
      } on FirebaseException catch (exc) {
        InAppNotificationHelper.snackBarNotification(
            context: context,
            message: exc.message ?? 'Some error in storing your data'.tr());
      } catch (e) {
        debugPrint('error: ${e.toString()}');
        InAppNotificationHelper.snackBarNotification(
            context: context, message: 'Some error in storing your data'.tr());
      }
    } else {
      Get.to(() => const AllViews());
    }
    return null;
  }
//-------------

//-------------
  //sign in with apple
  static signInWithApple(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    var isAvailable = await TheAppleSignIn.isAvailable();
    if (isAvailable) {
      try {
        final AuthorizationResult result =
            await TheAppleSignIn.performRequests([
          const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
        ]);

        switch (result.status) {
          case AuthorizationStatus.authorized:
            try {
              //Get Token
              final AppleIdCredential appleIdCredential = result.credential!;
              final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
              final credential = oAuthProvider.credential(
                  idToken:
                      String.fromCharCodes(appleIdCredential.identityToken!),
                  accessToken: String.fromCharCodes(
                      appleIdCredential.authorizationCode!));
              FirebaseAuth.instance.signInWithCredential(credential);
            } on PlatformException catch (error) {
              debugPrint(error.message);
            } on FirebaseAuthException catch (error) {
              debugPrint(error.message);
            }
            bool userCheck = await checkUserExist(auth.currentUser!.uid);

            if (!userCheck) {
              final user = auth.currentUser;

              final db = FirebaseFirestore.instance.collection("users");
              String uid = auth.currentUser!.uid;
              var messagingToken = await FirebaseMessaging.instance.getToken();

              UserModel userdata = UserModel(
                rattingCount: 0,
                rattings: 0.0,
                hostSettings: HostSettings(
                    isInstantBook: false,
                    shouldIdentityVerification: false,
                    shouldGoodTrackRecord: false),
                messagingToken: messagingToken ?? '',
                fullName: user!.displayName.toString(),
                uid: uid,
                imageUrl: user.photoURL ?? '',
                email: user.email.toString(),
                firstName: user.displayName.toString(),
                lastName: user.displayName.toString(),
                phoneNumber: user.phoneNumber.toString(),
                DOB: DateTime.now(),
              );

              try {
                await db.doc(uid).set(userdata.toMap());
                var token = await FirebaseMessaging.instance.getToken();
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .update({'token': token}).then((value) {
                  debugPrint('update token $token');
                });
                Get.to(
                  () => AddYourInfo(
                    imageUrl: user.photoURL ?? '',
                    userId: user.uid,
                    userPhoneNumber: user.phoneNumber ?? '',
                    userEmail: user.email ?? '',
                    isFromSocialMedia: true,
                  ),
                );
                //return 'success';
              } on FirebaseAuthException catch (exc) {
                InAppNotificationHelper.snackBarNotification(
                    context: context,
                    message: exc.message ?? 'Some error in storing your data'.tr());
              } on FirebaseException catch (exc) {
                InAppNotificationHelper.snackBarNotification(
                    context: context,
                    message: exc.message ?? 'Some error in storing your data'.tr());
              } catch (e) {
                debugPrint('error: ${e.toString()}');
                InAppNotificationHelper.snackBarNotification(
                    context: context,
                    message: 'Some error in storing your data'.tr());
              }
            } else {
              Get.to(() => const AllViews());
            }
            //for notifications
            var token = await FirebaseMessaging.instance.getToken();
            debugPrint('token $token');
            await FirebaseFirestore.instance
                .collection('users')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .set({'token': token}, SetOptions(merge: true)).then((value) {
              debugPrint('update token $token');
            });

            break;

          case AuthorizationStatus.error:
            debugPrint("Sign in failed: ${result.error!.localizedDescription}");

            break;

          case AuthorizationStatus.cancelled:
            debugPrint('User cancelled');
            break;
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

//-------------
//sing in with phone number
  static AuthenticationController authenticationController =
      AuthenticationController();
  static void sendCode(
      {required BuildContext context, required String phoneNumber}) async {
    // phoneNumber = '3000000000';
    if (phoneNumber.isEmpty) {
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'Enter Phone Number'.tr());
      return;
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+92$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        InAppNotificationHelper.snackBarNotification(
            context: context, message: e.message.toString());
      },
      codeSent: (verificationId, forceResendingToken) {
        // authenticationController.setVerificationId = verificationId;
        InAppNotificationHelper.snackBarNotification(
            context: context, message: 'Code Sent'.tr());
        Get.to(() => ConfirmNumberScreen(
              phoneNumber: phoneNumber,
              verificationId: verificationId,
            ));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        // authenticationController.setVerificationId = verificationId;
      },
      timeout: const Duration(seconds: 60),
    );
  }

  static void verifyCode({
    required BuildContext context,
    required String verificationId,
    required String verificationCode,
    required String phoneNumber,
  }) async {
    if (verificationCode.isEmpty) {
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'Enter OTP Code'.tr());
    }
    try {
      UserCredential authCredential;
      authCredential = await FirebaseAuth.instance.signInWithCredential(
          PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: verificationCode));

      if (authCredential.user != null) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(authCredential.user!.uid)
            .get()
            .then((doc) {
          if (doc.exists) {
            Get.to(() => const AllViews());
          } else {
            Get.to(
              () => AddYourInfo(
                imageUrl: '',
                userId: authCredential.user!.uid,
                userPhoneNumber: phoneNumber,
                userEmail: '',
              ),
            );
          }
        });
      }
    } catch (e) {
      FocusScope.of(context).unfocus();
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'Invalid OTP Code'.tr());
    }
  }

//sign in with email
  static void continueWithEmail(String email) async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      List<String> signInMethods = await auth.fetchSignInMethodsForEmail(email);
      if (signInMethods.isEmpty) {
        // User is not registered
        Get.to(
          () => AddYourInfo(
            imageUrl: '',
            userId: '',
            userPhoneNumber: '',
            userEmail: email,
          ),
        );
        debugPrint('user is not register');
      } else {
        // User is registered
        Get.to(() => LoginPasswordAfterEmail(
              email: email,
            ));
        debugPrint('User is registered');
      }
    } catch (e) {
      // An error occurred
    }
  }

//login with email password
  static void login(String email, String password, BuildContext context) async {
    debugPrint('email $email  password $password');
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.put(GeneralGetxController()).getCurrentUserData();

      Get.to(() => const AllViews());
      // Sign in successful
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      // An FirebaseAuthException occurred while signing in
      if (e.code == 'user-not-found') {
        InAppNotificationHelper.snackBarNotification(
            context: context, message: 'No user found for this email.'.tr());
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        InAppNotificationHelper.snackBarNotification(
            context: context,
            message: 'Wrong password provided for this user.'.tr());
        debugPrint('Wrong password provided for that user.');
      }
    } catch (e) {
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'An error occurred while signing in'.tr());
      // An error occurred while signing in
      debugPrint(e.toString());
    }
  }

//add user info
  static void addUserInfo(
      {required BuildContext context,
      required String userId,
      required String phoneNumber,
      required String firstName,
      required String lastName,
      required String dateOfBirth,
      required String email,
      required String password,
      bool isFromSocialMedia = false}) async {
    if (firstName.isEmpty) {
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'Enter First Name'.tr());
      return;
    }
    if (lastName.isEmpty) {
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'Enter Sur Name'.tr());
      return;
    }
    if (dateOfBirth.isEmpty) {
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'Choose Date Of Birth'.tr());
      return;
    }
    if (email.isEmpty) {
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'Enter Email'.tr());
      return;
    }
    if (password.isEmpty) {
      InAppNotificationHelper.snackBarNotification(
          context: context, message: 'Enter Password'.tr());
      return;
    }
    if (isFromSocialMedia) {
      debugPrint(' from social media ');
    } else {
      if (email.isNotEmpty) {
        try {
          var a = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);
          userId = a.user!.uid;
        } catch (e) {
          InAppNotificationHelper.snackBarNotification(
              context: context, message: 'Exception $e');
          return;
        }
      }
    }
    var messagingToken = await FirebaseMessaging.instance.getToken();

    var userModel = UserModel(
        rattingCount: 0,
        rattings: 0.0,
        hostSettings: HostSettings(
            isInstantBook: false,
            shouldIdentityVerification: false,
            shouldGoodTrackRecord: false),
        messagingToken: messagingToken ?? '',
        fullName: '$firstName $lastName',
        uid: userId,
        imageUrl: '',
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
        DOB: DateFormat("dd/MM/yyyy").parse(dateOfBirth),
        email: email);
    await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(userId)
        .set(userModel.toMap())
        .catchError((onError) {
      InAppNotificationHelper.snackBarNotification(
          context: context, message: onError.toString());
    }).then((_) {
      Get.to(() => const AllViews());
    });
  }
}
