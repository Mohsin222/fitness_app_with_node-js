import 'package:fitness_app/pages/full_screen_wall.dart';
import 'package:flutter/material.dart';

import '../providers/wallpaper_provider.dart';

//used in wallpapers page

class Wallpapers_grid extends StatelessWidget {
  final WallpaperProvider data;
  const Wallpapers_grid({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: MediaQuery.of(context).size.width > 500 ? 3 : 2,
        ),
        itemCount: data.wallpapersData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {},
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullScreenWall(
                          index: index,
                          image: data.wallpapersData[index].wallpapers ??
                              'https://images.unsplash.com/photo-1640142823298-5efa4b79e076?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80')));
            },
            child: Container(
              margin: EdgeInsets.all(2),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(data
                              .wallpapersData[index].wallpapers ??
                          'https://images.unsplash.com/photo-1640142823298-5efa4b79e076?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80'),
                      fit: BoxFit.fill,
                      opacity: 1)),
              child: Column(
                children: [],
              ),
            ),
          );
        });
  }
}
