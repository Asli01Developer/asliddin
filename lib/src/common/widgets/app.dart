import 'package:flutter/material.dart';
import 'package:skool/src/feature/home/pages/home_screen.dart';

import '../service/db_service.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  ValueNotifier<Locale> locale = ValueNotifier(Locale($storage.getString(StorageKeys.language.key) ?? 'en'));

  void changeLocale(Locale newLocale) => locale.value = newLocale;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Discover communities",
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
      ),home: const HomeScreen(),
    );
  }
}
