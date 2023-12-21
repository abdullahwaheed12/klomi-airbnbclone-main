import 'package:flutter/material.dart';

class InAppNotificationHelper{


  static void snackBarNotification(
    {
      required BuildContext context,
      required String message,
    }
  ){
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ));    
  }

}