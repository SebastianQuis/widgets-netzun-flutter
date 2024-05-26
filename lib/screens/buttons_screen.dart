import 'package:flutter/material.dart';


class ButtonsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            TextButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black12),
              ),
              label: const Text('Text button icon'),
              icon: const Icon(Icons.settings),
              onPressed: () {
                print('Text button icon');
              },
            ),
        
            MaterialButton(
              child: const Text('Material button'),
              onPressed: () {
                print('Material Button');
              },
            ),
        
            IconButton(
              onPressed: () {
                print('Icon button');
              }, 
              icon: const Text('icon button')
            )
        
          ],
        ),
      ),
   );
  }
}