// import 'package:firebase_core/firebase_core.dart';
import 'package:e_plaza_vendor/screens/splash_screen.dart';
import 'package:e_plaza_vendor/values/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  // Locale _locale;

  // String login = '';

  @override
  void initState() {
    super.initState();
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
        fontFamily: 'poppins',
        backgroundColor: ThemeColors.backgroundColor,
        primaryColor: ThemeColors.colorPrimary,
        primarySwatch: ThemeColors.colorPrimary,
        scaffoldBackgroundColor: ThemeColors.backgroundColor,
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: ThemeColors.colorPrimary),
        textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.grey)),
      ),
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate
      // ],
      // supportedLocales: Const.supportedAppLanguages.map((e) => Locale(e.languageCode)),
      // locale: _locale,
      // home: _home,
      home: SplashScreen(),
    );
  }

// Widget get _home {
//   if (login == 'yes') {
//     return empty();
//     // return HomeScreen();
//   } else if (login == 'no') {
//     return LoginWithOtpScreen();
//   } else {
//     return Container(
//       color: Colors.white,
//       alignment: Alignment.center,
//       child: assetImage('assets/icons/logo.png', width: 80, height: 80),
//     );
//   }
// }
}
