import 'package:flutter/material.dart';

import 'app/app_page.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_strings.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      //darkTheme: getThemeDataDark(),
      home: const App(),
      //home:  const MoviesScreen(),
    );
  }
}



