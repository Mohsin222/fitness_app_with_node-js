import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

import '../models/wallpapers_model.dart';
import '../services/fetch_api.dart';

class WallpaperProvider extends ChangeNotifier {

// ignore: non_constant_identifier_names
List fitness_categories=[
  'Fitness',
  'Gym',
  'Motivation',
  'Yoga',
  'Workout',
  'Bodybuilding',
  'Diet',
  'Calories',
  
  

];

// ignore: non_constant_identifier_names
String categ_value='gym fitness';

  //fetch wallpapers
  List<WallpapersClass> wallpapersData = [];
  Future<List<WallpapersClass>> fetchWall() async {
    wallpapersData = await ApiClass().fetchWallpapers(categ_value);

    notifyListeners();

    return wallpapersData;
  }

//download wallpapers
  downloadImg(String url, BuildContext context) async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(url,
          destination: AndroidDestinationType.directoryDownloads
            ..subDirectory("fitness_app/flutter_image.png"));

      print('iamge download success');
      if (imageId == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Error"),
        ));

        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Downloaded"),
      ));

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }
}
