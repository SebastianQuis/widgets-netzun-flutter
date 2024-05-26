import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class DrawerScreen extends StatefulWidget {

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int number = 0;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('Drawer'),
      ),

      drawer: Drawer(

        backgroundColor: const Color(0xffFffffff),
        child: SafeArea(
          child: Column(
            children: [
          
              Image(
                height: size.height * 0.3,
                width: double.infinity,
                image: const AssetImage('assets/computer.png'),
                fit: BoxFit.fill,
              ),
          
              const SizedBox(height: 10,),
          
              const Text('Juan Diego', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),),
              
              const ItemButton(title: 'Inicio', leading: Icon(Icons.important_devices_outlined)),
          
              
              const ItemButton(title: 'Categorías', leading: Icon(Icons.category_outlined)),
              const ItemButton(title: 'Busqueda', leading: Icon(Icons.search_off)),
              const ItemButton(title: 'Ajustes', leading: Icon(Icons.settings)),
          
          
            ],
          ),
        ),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hola Mundo $number'),
            TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.indigo),
              ),
              onPressed: () {
                setState(() {
                  number++;
                });
              }, 
              child: const Text('Cambiar', style: TextStyle(color: Colors.white),)
            )
          ],
        ),
      ),
   );
  }
}

class ItemButton extends StatelessWidget {
  final String title;
  final Widget leading;
  // final Widget trailing;

  const ItemButton({super.key, required this.title, required this.leading});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, ),
      decoration: const BoxDecoration(
        // color: Colors.black12
      ),
      child: ListTile(
        // onTap: () => print('Ajustes!!'),
        leading: leading,
        title: Text(title),
        trailing: const Icon(Icons.next_plan_rounded, color: Colors.indigo,),
      ),
    );
  }
}