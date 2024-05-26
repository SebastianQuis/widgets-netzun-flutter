import 'package:flutter/material.dart';

import 'package:widgets_basicos/screens/hero_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      // home: ButtonsScreen(),
      // home: HeroScreen(),
      initialRoute: HeroScreen.heroRoute,
      routes: {
        HeroScreen.heroRoute: (context) => HeroScreen(),
        Hero2Screen.hero2Route: (context) => Hero2Screen(),
      },
      theme: ThemeData(primarySwatch: Colors.indigo)
    );
  }
  
}


