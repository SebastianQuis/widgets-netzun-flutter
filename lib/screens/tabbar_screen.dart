import 'package:flutter/material.dart';


class TabBarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbsar'),
      ),


      body: const DefaultTabController(
        length: 2, 
        child: Column(
          children: [

            TabBar(
              tabs: [
                Tab(
                  child: Icon(Icons.home),
                ),
                Tab(
                  child: Icon(Icons.person),
                ),
              ]
            ),

            Expanded(
              child: TabBarView( // TODO - CREAR LOS SCREENS
                children: [
                  Center(child: Text('Home')),
                  Center(child: Text('Home')),
                  // Text('Person'),
                ]
              ),
            )

          ],
        ),
        
      ),
      
    );
  }
}