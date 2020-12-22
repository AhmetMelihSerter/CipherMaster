import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:background_fetch/background_fetch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ciphermaster/core/init/theme/app_theme_light.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';
import 'package:ciphermaster/core/init/language/language_manager.dart';
import 'package:ciphermaster/core/init/navigation/navigation_route.dart';
import 'package:ciphermaster/core/init/background/background_manager.dart';
import 'package:ciphermaster/core/init/provider/application_provider.dart';
import 'package:ciphermaster/core/init/navigation/navigation_service.dart';
import 'package:ciphermaster/core/constants/navigation/navigation_constants.dart';

void backgroundFetchHeadlessTask(String taskId) async {
  try {
    await Firebase.initializeApp();
    debugPrint("Firebase init flutter");
    await Hive.initFlutter();
    debugPrint("Hive init flutter");
    print("[BackgroundFetch] Headless event received: $taskId");
    

    print("Android Background Task Successfully");
  } catch (e) {
    debugPrint("No internet connection");
    BackgroundFetch.finish(taskId);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  debugPrint("Firebase init flutter");
  await Hive.initFlutter();
  debugPrint("Hive init flutter");
  runApp(
    EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANGUAGE_PATH,
      child: MultiProvider(
        providers: ApplicationProvider.instance.uiChangesItems,
        child: MyApp(),
      ),
    ),
  );
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    BackgroundFetch.configure(
        BackgroundFetchConfig(
            minimumFetchInterval: 60 * 4,
            stopOnTerminate: false,
            startOnBoot: true,
            enableHeadless: true,
            requiredNetworkType: NetworkType.ANY), (String taskId) async {
      print("[BackgroundFetch] Event received $taskId");
      BackgroundFetch.finish(taskId);
    }).then((int status) {
      print('[BackgroundFetch] configure success: $status');
    }).catchError((e) {
      print('[BackgroundFetch] configure ERROR: $e');
    });
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeLight.instance.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: NavigationConstants.loginView,
      //routes: NavigationRoute.instance.routes,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
