import 'dart:convert';

import 'package:fitness_app/models/exersice_model.dart';
import 'package:fitness_app/models/wallpapers_model.dart';
import 'package:fitness_app/providers/api_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ApiClass {
  List<ExersiceModel> fitnessData = [];

  Future getPostData2() async {
    final response = await http
        .get(Uri.parse('https://mohsindemoapi.herokuapp.com/fitness'));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        fitnessData.add(ExersiceModel.fromJson(i));
      }

      return fitnessData;
    } else {
      return fitnessData;
    }
  }

    List n1=[
  //     {
  // "title": "https://cdn.pixabay.com/photo/2019/08/11/16/31/fitness-4399322__340.jpg"
  // },
  // {
  // "title": "https://cdn.pixabay.com/photo/2021/11/20/08/24/woman-6811190__340.jpg"
  // },
  // {
  // "title": "https://cdn.pixabay.com/photo/2019/11/08/11/23/brutal-4611118__340.jpg"
  // }
    ];
  //fetch wallpapers
    List<WallpapersClass> walls = [];
    Future fetchWallpapers(String val) async {
    final response = await http
  .get(Uri.parse('https://mohsindemoapi.herokuapp.com/wallpapers/wall/$val'));
//  .get(Uri.parse('https://mohsindemoapi.herokuapp.com/fitness/wall'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
    //    print(i);
        walls.add(WallpapersClass.fromJson(i));
      }
//extra
          for (Map i in n1) {
     //   print(i);
        walls.add(WallpapersClass.fromJson(i));
      }
      

      return walls;
    } else {
      return walls;
    }
  }
}
