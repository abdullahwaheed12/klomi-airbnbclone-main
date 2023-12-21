
import 'package:get/get.dart';

class AuthenticationController extends GetxController {

  String? _verificationId;

  String? get getVerificationId => _verificationId;

  set setVerificationId(String? verificationId) {
    _verificationId = verificationId;
    update();
  }

}