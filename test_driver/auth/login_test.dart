import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:ciphermaster/views/_model/user.dart';

void main() {
  Duration pageFutureWaitSeconds = Duration(seconds: 2);
  Duration pageInWaitMilli = Duration(milliseconds: 500);
  var mailTextAlready = "test@test.com ";
  var mailText = "test2@test2.com";
  var mailTextWrong = "ahmet melih";
  var passwordTextWrong = "ahmetmelihserter";
  var passwordText = "aaaaaaaaaa";
  var passwordNotValid = "123456";

  FlutterDriver driver;
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() {
    if (driver != null) {
      driver.close();
    }
  });

  group('sign in tester', () {
    var mailKey = find.byValueKey('mail');
    var passwordKey = find.byValueKey('password');
    var loginButtonKey = find.text('Sign In');
    var alertDialogButton = find.text('OK');

    test('email and password not valid', () async {
      var emailNotValidText = 'Please enter valid email address!!!';
      var emailNotValidKey = find.text(emailNotValidText);
      var passwordNotValidText =
          'Password can\'t be less than ${User.MIN_PASSWORD_LEN} characters!!!';
      var passwordNotValidKey = find.text(passwordNotValidText);

      await driver.tap(mailKey);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(mailTextWrong);

      await driver.tap(passwordKey);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(passwordText);

      await driver.tap(loginButtonKey);
      await Future.delayed(pageInWaitMilli);

      expect(await driver.getText(emailNotValidKey), emailNotValidText);

      await driver.tap(mailKey);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(mailTextAlready);

      await driver.tap(passwordKey);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(passwordNotValid);

      await driver.tap(loginButtonKey);
      await Future.delayed(pageInWaitMilli);

      expect(await driver.getText(passwordNotValidKey), passwordNotValidText);
    });

    test('user not found', () async {
      var userNotFoundText = 'User not found.';
      var userNotFoundKey = find.text(userNotFoundText);

      await driver.tap(mailKey);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(mailTextAlready);

      await driver.tap(passwordKey);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(passwordText);

      await driver.tap(loginButtonKey);
      await Future.delayed(pageFutureWaitSeconds);

      expect(await driver.getText(userNotFoundKey), userNotFoundText);

      await driver.tap(alertDialogButton);
      await Future.delayed(pageFutureWaitSeconds);
    });
    test('wrong password', () async {
      var wrongPasswordText = 'Email or Password wrong.';
      var wrongPasswordKey = find.text(wrongPasswordText);

      await driver.tap(mailKey);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(mailText);

      await driver.tap(passwordKey);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(passwordTextWrong);

      await driver.tap(loginButtonKey);
      await Future.delayed(pageFutureWaitSeconds);

      expect(await driver.getText(wrongPasswordKey), wrongPasswordText);

      await driver.tap(alertDialogButton);
      await Future.delayed(pageFutureWaitSeconds);
    });

    test('sign in and sign out', () async {
      var appsMenu = find.text('Apps');
      var mainMenu = find.text('Main');
      var settingsKey = find.byValueKey('settings');
      var signOutButton = find.text('Sign Out');

      await driver.tap(mailKey);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(mailText);

      await driver.tap(passwordKey);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(passwordText);

      await driver.tap(loginButtonKey);
      await Future.delayed(pageFutureWaitSeconds);

      await driver.tap(appsMenu);
      await Future.delayed(pageFutureWaitSeconds);

      await driver.tap(mainMenu);
      await Future.delayed(pageInWaitMilli);

      await driver.tap(settingsKey);
      await Future.delayed(pageInWaitMilli);

      await driver.tap(signOutButton);
      await Future.delayed(pageInWaitMilli);

      await driver.tap(alertDialogButton);
      await Future.delayed(pageInWaitMilli);
    });
  });
}
