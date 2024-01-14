import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/splashScreen.dart';
import 'Services/PrefrenceService.dart';
import 'counter_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    var preference = await SharedPreferences.getInstance();
    GetIt.I.registerSingleton<SharedPreferences>(preference);

    if (PrefrencesService.prefs != null) {
      print(
          '========================= prefrences init Successfully ========================');
    }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  //runApp(BlocProvider<CounterCubit>(
  // create: (context) => CounterCubit(), child: myApp()));
//}
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => CounterProvider()),
    FutureProvider<String>(
        create: (_) => AddressProvider().getAddress(), initialData: "loading"),

  ],
      child: myApp()));
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SubjectRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Hellix',
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xfff45b00),
            primary: Color(0xfff45b00),
            secondary: Color(0xfff45b00),
          ),
          useMaterial3: true,
        ),
        home: SplashPage(),
      ),
    );
  }

}
