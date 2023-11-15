import 'package:e_plaza/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:e_plaza/screens/login/login.dart';
// import 'package:e_plaza/screens/dashboard/dashboard_screen.dart';
import 'package:e_plaza/utils/logger.dart';
import 'package:e_plaza/utils/preference.dart';
import 'package:e_plaza/values/theme_colors.dart';
import 'package:e_plaza/widgets/widgets.dart';

import 'utils/const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configLoading();
  runApp(const MyApp());

  // try {
  //   PlatformType.platformType = Platform.operatingSystem;
  //   // FlutterDownloader.initialize(debug: Const.isDeveloper);
  //   // if (PlatformType.isAndroid || PlatformType.isIOS) {
  //   //   BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  //   // }
  // } catch (e) {
  //   PlatformType.platformType = 'web';
  // }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..indicatorColor=Colors.red
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.red
    ..backgroundColor = Colors.white
    ..textColor = Colors.black
    ..textStyle = TextStyle(fontSize: 16, color: Colors.black)
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false;
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  // Locale _locale;

  String login = '';
  _MyAppState() {
    configLoading();
  }

  @override
  void initState() {
    super.initState();
    Logger.logEnabled = Const.isDeveloper;
    Preference.init().whenComplete(() async {
      if (Preference.isLogin) {
        login = 'yes';
      } else {
        login = 'no';
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.black87));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      // navigatorKey: Helper.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'avenir',
        backgroundColor: ThemeColors.backgroundColor,
        primaryColor: ThemeColors.colorPrimary,
        primarySwatch: ThemeColors.colorPrimary,
        scaffoldBackgroundColor: ThemeColors.backgroundColor,
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ThemeColors.colorPrimary),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(primary: Colors.grey)),
      ),
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate
      // ],
      // supportedLocales: Const.supportedAppLanguages.map((e) => Locale(e.languageCode)),
      // locale: _locale,
      builder: EasyLoading.init(),
      home: _home,
    );
  }

  Widget get _home {
    if (login == 'yes') {
      // return empty();
      return HomeScreen();
    } else if (login == 'no') {
      return LoginScreen();
    } else {
      return Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: assetImage('assets/icons/logo.png', width: 80, height: 80),
      );
    }
  }




}
