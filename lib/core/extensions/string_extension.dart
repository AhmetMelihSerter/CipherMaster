import 'package:easy_localization/easy_localization.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

extension StringExtension on String {
  String get locale => this.tr();

  String localeArgs({List<String> args}) => this.tr(args: args);

  String get isValidMail {
    if (this.trim().contains(RegExp(ApplicationConstants.MAIL_REGEXP)))
      return null;
    else
      return 'validator_mail'.locale;
  }
}
