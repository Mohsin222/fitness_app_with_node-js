import 'dart:developer';

import 'package:fitness_app/constant/wall_loading_grid.dart';
import 'package:fitness_app/pages/full_screen_wall.dart';
import 'package:fitness_app/providers/wallpaper_provider.dart';
import 'package:fitness_app/widgets/wallpaper_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../widgets/elevated_btn_1.dart';

class Wallpapers_screen extends StatelessWidget {
  const Wallpapers_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final walls = Provider.of<WallpaperProvider>(context, listen: false);
    return Scaffold(
   
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Wallpapers_screen()));
              },
              icon: const Icon(Icons.replay_5_outlined))
        ],
      ),
      body: Consumer<WallpaperProvider>(
builder: ((context, wallCons, child) {
        
        return Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                   wallCons.fitness_categories.length,
                    ((index) => Elevated_btn_1(
                      index: index,
                      data: wallCons,
                      press: () async {
          wallCons.wallpapersData.clear();
         wallCons.categ_value = wallCons.fitness_categories[index];
          log(wallCons.categ_value);
          wallCons.fetchWall();
        },
                    ))),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/20,),
            Expanded(
              child: FutureBuilder(
                future: wallCons.fetchWall(),
                builder: (context, AsyncSnapshot snapshot) {
            
                  if(snapshot.connectionState != ConnectionState.done){
                          if (snapshot.hasData) {
                    return Wallpapers_grid(data: wallCons,);
                  }
                         if (snapshot.hasError) {
                    return Center(
                      child: Text('error',style: TextStyle(color: Colors.white,),),
                    );
                  } else {
                                   return WallLoadingGrid();
                  }
                  }

                      return WallLoadingGrid();
      
           
                  
                },
              ),
            ),
          ],
        );

  })
      ),
    );
  }
}



