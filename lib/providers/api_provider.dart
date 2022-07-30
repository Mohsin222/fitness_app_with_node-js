
import 'package:fitness_app/models/exersice_model.dart';
import 'package:fitness_app/models/wallpapers_model.dart';
import 'package:fitness_app/services/fetch_api.dart';
import 'package:flutter/cupertino.dart';

class ApiProvider extends ChangeNotifier{
  List<ExersiceModel> fitnessData=[];
  String search_query='';

  Future<List<ExersiceModel>> FetchData()async{

fitnessData =await   ApiClass().getPostData2();
 

     notifyListeners();

   return fitnessData;
  }


  List<ExersiceModel> getFilteredData(String sreachQuery){

    return fitnessData.where((element) => 
    element.title!.toLowerCase().contains(sreachQuery.toLowerCase())
    ).toList();
  }




  
}