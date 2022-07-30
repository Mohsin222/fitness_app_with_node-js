import 'package:flutter/material.dart';

import '../providers/wallpaper_provider.dart';

class Elevated_btn_1 extends StatelessWidget {
  final WallpaperProvider data;
  final VoidCallback press;
  final int index;
  const Elevated_btn_1({
    Key? key, required this.press, required this.data, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
             padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        
          onPressed: press,
          child: Text(data.fitness_categories[index],style: const TextStyle(fontSize: 18,color: Colors.black),),
                         style: ButtonStyle(
      
      backgroundColor: MaterialStateProperty.all(Colors.white),
      padding:  MaterialStateProperty.all(EdgeInsets.all(20)),
      
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 23,color: Colors.black),
        
      ),
      ),
          ),
    );
  }
}