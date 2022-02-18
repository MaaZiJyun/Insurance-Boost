import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:insurance_boost/pages/change_pwd_page.dart';
import 'package:insurance_boost/pages/edit_profile_page.dart';
import 'package:insurance_boost/global/global_variables.dart' as globals;
import 'package:insurance_boost/pages/home_page.dart';
import 'package:insurance_boost/pages/home_welcome.dart';
import 'package:insurance_boost/pages/login_signup/login_screen.dart';
import 'package:insurance_boost/pages/login_signup/signup_sreen.dart';
import 'package:insurance_boost/pages/package_page.dart';
import 'package:insurance_boost/pages/reward_page.dart';
import 'package:insurance_boost/pages/settings_page.dart';
import 'package:insurance_boost/pages/splash_page.dart';
import 'package:insurance_boost/pages/welcome_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) {
        return AppLocalizations.of(context)!.appTitle;
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/': (context) => SignupScreen(),
        '/WelcomeScreen': (context) => WelcomeScreen(),
        '/LoginScreen': (context) => LoginScreen(),
        '/SignupScreen': (context) => SignupScreen(),
        '/Home': (context) => HomePage(),
        '/SettingsPage': (context) => SettingsPage(),
        '/EditProfilePage': (context) => EditProfilePage(),
        '/ChangePwdPage': (context) => ChangePwdPage(),
      },
    );
  }
}
