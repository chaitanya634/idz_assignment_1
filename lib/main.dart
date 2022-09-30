import 'package:flutter/material.dart';
import 'package:idz_assignment_1/themes/light.dart';

import 'pages/registration.dart';
import 'pages/user_details.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      themeMode: ThemeMode.light,
      title: 'Assignment 1',
      initialRoute: RegistrationPage.routeName,
      routes: {
        RegistrationPage.routeName :(context) =>  RegistrationPage(),
        UserDetailsPage.routeName :(context) => const UserDetailsPage(),
      },
    );
  }
}