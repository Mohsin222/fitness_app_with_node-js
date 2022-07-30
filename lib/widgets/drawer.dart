import 'package:fitness_app/pages/wallpapers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Drawer_widget extends StatelessWidget {
  const Drawer_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(('https://images.unsplash.com/photo-1623946724822-ba48a838f3da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTEzOXx8d29ya2luZyUyMG91dHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')),fit: BoxFit.fill),
                color: Colors.blue,
              ),
              child: Text('Fitness',style: TextStyle(fontSize: 25,color: Colors.white,),),
            ),
            ListTile(
              title: const Text('Wallpapers',
              style: TextStyle(fontSize: 20,color: Colors.white,),
              ),
              onTap: () {

            Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Wallpapers_screen()));
              
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }
}