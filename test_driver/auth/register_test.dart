import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:ciphermaster/views/_model/user.dart';

void main() {
  Duration pageFutureWaitSeconds = Duration(seconds: 2);
  Duration pageInWaitMilli = Duration(milliseconds: 500);
  var nameTextChange = "ahm";
  var nameText = "ahmet melih";
  var mailText = "testr@test.com ";
  var mailTextAlreadyUse = "test2@test2.com";
  var mailTextWrong = "ahmetmelihserter";
  var passwordText = "ahmetmelihserter";
  var passwordRepeatTextWrong = "ahmetmelihsert";

  FlutterDriver driver;
  setUpAll(() async {
    var registerButtonKey = find.text('Register');
    driver = await FlutterDriver.connect();
    await driver.tap(registerButtonKey);
    await Future.delayed(pageInWaitMilli);
  });

  tearDownAll(() {
    if (driver != null) {
      driver.close();
    }
  });

  var nextButton = find.byValueKey('registerNext');
  var backButton = find.byValueKey('registerBack');

  group('sign up tester', () {
    test('back and next button', () async {
      await driver.enterText(nameText);

      await driver.tap(nextButton);
      await Future.delayed(pageInWaitMilli);

      await driver.tap(backButton);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText('');
    });

    test('name not valid', () async {
      var nameNotValidText = 'Enter at least ${User.MIN_NAME_LEN} characters.';
      var nameNotValidKey = find.text(nameNotValidText);

      await driver.enterText(nameTextChange);

      await driver.tap(nextButton);
      await Future.delayed(pageInWaitMilli);

      expect(await driver.getText(nameNotValidKey), nameNotValidText);

      await driver.enterText(nameText);

      await driver.tap(nextButton);
      await Future.delayed(pageInWaitMilli);
    });

    test('email not valid', () async {
      var emailNotValidText = 'Please enter valid email address!!!';
      var emailNotValidKey = find.text(emailNotValidText);

      await driver.enterText(mailTextWrong);

      await driver.tap(nextButton);
      await Future.delayed(pageInWaitMilli);

      expect(await driver.getText(emailNotValidKey), emailNotValidText);

      await driver.enterText(mailText);

      await driver.tap(nextButton);
      await Future.delayed(pageInWaitMilli);
    });

    test('password not valid', () async {
      var passwordNotValidText = 'The Two Passwords Entered Do Not Match.';
      var passwordNotValidKey = find.text(passwordNotValidText);
      await driver.enterText(passwordText);

      await driver.tap(nextButton);
      await Future.delayed(pageInWaitMilli);

      await driver.enterText(passwordRepeatTextWrong);

      await driver.tap(nextButton);
      await Future.delayed(pageInWaitMilli);

      expect(await driver.getText(passwordNotValidKey), passwordNotValidText);
    });
  });

  test('mail already', () async {
    var emailAlreadyText = 'Email already in use.';
    var emailAlreadyKey = find.text(emailAlreadyText);

    await Future.delayed(pageInWaitMilli);

    await driver.enterText(mailTextWrong);

    await driver.tap(nextButton);
    await Future.delayed(pageInWaitMilli);

    await driver.enterText(mailTextAlreadyUse);

    await driver.tap(nextButton);
    await Future.delayed(pageInWaitMilli);

    await driver.enterText(passwordText);

    await driver.tap(nextButton);
    await Future.delayed(pageInWaitMilli);

    await driver.enterText(passwordText);

    await driver.tap(nextButton);
    await Future.delayed(pageFutureWaitSeconds);

    expect(await driver.getText(emailAlreadyKey), emailAlreadyText);
  });

  test('sign up', () async {
    var signUpSuccessText = 'Register Successful';
    var signUpSuccessKey = find.text(signUpSuccessText);

    await Future.delayed(pageInWaitMilli);

    await driver.enterText(mailTextWrong);

    await driver.tap(nextButton);
    await Future.delayed(pageInWaitMilli);

    await driver.enterText(mailText);

    await driver.tap(nextButton);
    await Future.delayed(pageInWaitMilli);

    await driver.enterText(passwordText);

    await driver.tap(nextButton);
    await Future.delayed(pageInWaitMilli);

    await driver.enterText(passwordText);

    await driver.tap(nextButton);
    await Future.delayed(pageFutureWaitSeconds);

    expect(await driver.getText(signUpSuccessKey), signUpSuccessText);
  });
}
