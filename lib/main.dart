import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/splashScreen.dart';
import 'Services/PrefrenceService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {

  var preference= await SharedPreferences.getInstance();
    GetIt.I.registerSingleton<SharedPreferences>(preference);

    if (PrefrencesService.prefs != null) {
      print(
          '========================= prefrences init Successfully ========================');
    }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );


  }

}
