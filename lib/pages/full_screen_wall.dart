import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/wallpaper_provider.dart';

class FullScreenWall extends StatelessWidget {
  final int index;
  final String image;
  const FullScreenWall({Key? key, required this.image, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final walls = Provider.of<WallpaperProvider>(context,listen: false);
    return Scaffold(
   //   backgroundColor: Colors.black,
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(image),fit: BoxFit.contain)),
      child: Column(
        children: [
          Spacer(),

          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){
       
                 walls.downloadImg('${walls.wallpapersData[index].wallpapers }',context);
                
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Icon(Icons.download,color: Colors.black,size: 30,),
              ),
            ),

  
          ),
                    SizedBox(height: MediaQuery.of(context).size.height/13),
        ],
      ),
      ),
    );
  }
}