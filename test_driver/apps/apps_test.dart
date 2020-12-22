import 'package:test/test.dart';
import 'package:flutter_driver/flutter_driver.dart';

void main() {
  Duration pageFutureWaitSeconds = Duration(seconds: 2);
  Duration pageInWaitMilli = Duration(milliseconds: 500);
  var mailText = "test@test.com";
  var passwordText = "aaaaaaaaaa";

  FlutterDriver driver;
  setUpAll(() async {
    var mailKey = find.byValueKey('mail');
    var passwordKey = find.byValueKey('password');
    var loginButtonKey = find.text('Sign In');
    var appsMenu = find.text('Apps');
    driver = await FlutterDriver.connect();

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
  });

  tearDownAll(() {
    if (driver != null) {
      driver.close();
    }
  });

  group('apps tester', () {

    test('apps add', () {
      
    });

    test('apps edit', () {
      
    });

    test('apps delete', () {
      
    });

  });
}
