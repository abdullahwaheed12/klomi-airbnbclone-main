import 'package:flutter/services.dart';
import 'package:klomi/controllers/general_controller.dart';
import 'package:klomi/contstant/colors.dart';
import 'package:klomi/helper/main_helper.dart';
import 'package:klomi/themepallete.dart';
import 'package:klomi/utiles/kyes.dart';
import 'package:klomi/utiles/local_notification.dart';
import 'package:klomi/views/hosting/all_views/hosting_all_views.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';
import 'utiles/videosdk_utils/meeting_methods.dart';
import 'views/allViews/all_views.dart';
import 'views/login/login_screen.dart';

//-->>  calendar https://pub.dev/packages/calendar_builder
Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  //-- if caling
  var isCalling = message.data['isCalling'];
  if (isCalling != null) {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    showCallkitIncoming(message);
    await GetStorage.init();
    GetStorage().write('callFromTerminateState', message.data);
  }
  //------ if other
  if (message.data['animities'] == null) {
    udpateMessageStatus(message);
  } else {
    updateListing(message);
  }
}

void main() async {
  await MainHelper.projectInitilization();
  await GetStorage.init();
  // ignore: invalid_use_of_visible_for_testing_member
  // SharedPreferences.setMockInitialValues({});

  // subscribe to topic on each app start-up
  FirebaseMessaging.instance.subscribeToTopic('all');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: secondaryColor));
  FirebaseMessaging.instance.onTokenRefresh.listen((event) {
    Get.find<GeneralGetxController>().updateUserToken();
  });

  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {});
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
      path: 'assets/languages',
      // startLocale: const Locale('fr', 'FR'),
      // fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      saveLocale: true,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // forground messages
    FirebaseMessaging.onMessage.listen((message) {
      var isCalling = message.data['isCalling'];

      debugPrint('isCalling------>>>>>>> $isCalling');
      if (isCalling != null) {
        showCallkitIncoming(message);
      } else {
        debugPrint('A bg message just showed up :  ${message.data}');
        udpateMessageStatus(message);
        try {
          LocalNotificationService.initialize(context);
          LocalNotificationService.display(message);
        } catch (e) {
          debugPrint('exception in notification ${e.toString()}');
        }
      }
    });
    // when in the foreground
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint('onMessageOpenedApp');
      var isCalling = message.data['isCalling'];
      debugPrint('onMessageOpenedApp. $isCalling');
      if (isCalling != null) {
        var mettingId = message.data[mettingIdKey];
        var displayName = message.data[displayNameKey];
        var callingId = message.data[callinIdKey];
        joinCalling(displayName, mettingId, callingId, context);
      }
    });
    //when app is open from the terminate state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      debugPrint('getInitialMessage');
      if (GetStorage().read('callFromTerminateState') != null) {
        var data = GetStorage().read('callFromTerminateState');
        var mettingId = data[mettingIdKey];
        var displayName = data[displayNameKey];
        var callingId = data[callinIdKey];
        joinCalling(displayName, mettingId, callingId, context);
      }
    });

    bool checkForHostingSwtich() {
      bool isSwitchToHosting =
          GetStorage().read(AppKeys.isSwitchToHostKey) ?? false;
      return isSwitchToHosting;
    }

    return RestartWidget(
      child: GetMaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: "Klomi",
        navigatorObservers: [
          GetObserver(),
        ],
        theme: ThemeData(
          checkboxTheme: const CheckboxThemeData(
            checkColor: MaterialStatePropertyAll(Colors.white),
            fillColor: MaterialStatePropertyAll(Colors.black),
          ),
          primarySwatch: Palette.cToDark,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: primaryColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black)),
          primaryColor: primaryColor,
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: const TextStyle(fontSize: 14),
            isDense: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.black)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: FirebaseAuth.instance.currentUser != null
            ? checkForHostingSwtich()
                ? const HostingAllViews()
                : const AllViews()
            : const LogIn(),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<RestartWidgetState>()!.restartApp();
  }

  @override
  RestartWidgetState createState() => RestartWidgetState();
}

class RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
