import 'package:ciphermaster/core/extensions/string_extension.dart';

class ErrorConstants {
  static String error(String errorCode) {
    if (errorCode.contains('user-not-found'))
      return 'error_user_not_found'.locale;
    else if (errorCode.contains('email-already-in-use'))
      return 'error_email_already_in_use'.locale;
    else if (errorCode.contains('wrong-password'))
      return 'error_wrong_mail_password'.locale;
    else if (errorCode.contains('network-request-failed'))
      return 'error_network_failed'.locale;
    else if (errorCode.contains('too-many-requests'))
      return 'error_too_many_requests'.locale;
    else if (errorCode.contains('email-not-verified'))
      return 'error_email_not_verified'.locale;
    else if (errorCode.contains('deletion_error'))
      return 'error_deletion'.locale;
    else if (errorCode.contains('app_maximum_size'))
      return 'error_app_maximum_size'.locale;
    else if (errorCode.contains('photo_maximum_size'))
      return 'error_photo_maximum_size'.locale;
    else if (errorCode.contains('no_images_selected'))
      return 'error_no_images_selected'.locale;
    else if (errorCode.contains('setting-not-found'))
      return 'error_setting_not_found'.locale;
    else if (errorCode.contains('no_network_connection'))
      return 'error_no_network_connection'.locale;
    else if (errorCode.contains('TimeoutException'))
      return 'error_timeout'.locale;
    else
      return 'error_generic'.locale;
  }
}
