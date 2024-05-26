import 'package:flutter/material.dart';


class NavigationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Hola Mundo'),
     ),

     bottomNavigationBar: NavigationBarTheme(
      data: const NavigationBarThemeData(
        indicatorColor: Colors.indigo,

        // overlayColor: MaterialStatePropertyAll(Colors.indigo)
      ), 
      child: NavigationBar(
        onDestinationSelected: (value) {
          print(value); // todo - cambiar screens
        },
        backgroundColor: Colors.blueGrey,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: 1,
        // indicatorColor: Colors.red,
        height: 80,
        destinations: [
          
          const NavigationDestination(
            icon: Icon(Icons.home), 
            label: 'Home'
          ),
          
          const NavigationDestination(
            icon: Icon(Icons.person_off_outlined), 
            label: 'Profile'
          ),
        ]
      )
    ),
   );
  }
}