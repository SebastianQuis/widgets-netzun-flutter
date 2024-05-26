import 'package:flutter/material.dart';


class HeroScreen extends StatelessWidget {
  static String heroRoute = 'HeroScreen';
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero 1'),
      ),
      
      body: Center(
        child: GestureDetector(
          onTap: () {
            print('CLIK');
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const Hero2Screen();
              },
            ));

          },
          child: const Hero(
            tag: 'taghero',
            child: Image(
              image: NetworkImage(
                'https://images.freeimages.com/images/large-previews/d4f/www-1242368.jpg'
              )
            ),
          ),
        )
     ),
   );
  }
}


class Hero2Screen extends StatelessWidget {
  static String hero2Route = 'Hero2Screen';
  const Hero2Screen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero 2'),
      ),

      body: const Hero(
        tag: 'taghero',
        child: Image(
          image: NetworkImage(
            'https://images.freeimages.com/images/large-previews/d4f/www-1242368.jpg'
          )
        ),
      ),
    );
  }
}

