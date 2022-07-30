import 'package:fitness_app/const.dart';
import 'package:fitness_app/models/exersice_model.dart';
import 'package:fitness_app/pages/select_time.dart';
import 'package:fitness_app/pages/wallpapers.dart';
import 'package:fitness_app/prac/save_img.dart';
import 'package:fitness_app/providers/api_provider.dart';
import 'package:fitness_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  String search_query = '';

  @override
  Widget build(BuildContext context) {
    final apiData = Provider.of<ApiProvider>(context, listen: false);
    return Scaffold(
    
        drawer:const Drawer_widget(),
     
        appBar: AppBar(
          title:const Text('Home Page'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text(
                'Fitness App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 20, bottom: 20, top: 0, left: 12),
              alignment: Alignment.centerLeft,

              // width: MediaQuery.of(context).size.width/1.2,
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),

              child: TextField(
                  onChanged: (val) {
                    setState(() {
                      search_query = val;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: textField_decoration),
            ),
            Expanded(
              child: FutureBuilder(
                  future: Provider.of<ApiProvider>(context, listen: false)
                      .FetchData(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error"),
                      );
                    }
                    if (snapshot.hasData) {
                      if (apiData.getFilteredData(search_query).length > 0) {
                        //if search resut in find
                        return GridView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            crossAxisCount: 2,
                          ),
                          itemCount:
                              apiData.getFilteredData(search_query).length,
                          itemBuilder: (context, index) {
                            ExersiceModel exersiceModel =
                                apiData.getFilteredData(search_query)[index];
                            return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelectTime_Screen(index: index)));
                                },
                                child: HomeCard_search_result(
                                    exersiceModel, index));
                          },
                        );
                      } else {
                        //without search
                        return GridView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            crossAxisCount: 2,
                          ),
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SelectTime_Screen(index: index)));
                              },
                              child: Container(
                                margin: EdgeInsets.all(2),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage(apiData
                                            .fitnessData[index].thumbnail
                                            .toString()),
                                        fit: BoxFit.fill,
                                        opacity: 1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        apiData.fitnessData[index].title
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.brown[100]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    } else {
                      return Center(
                          child: Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.grey,
                              period: Duration(seconds: 2),
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 0,
                                  crossAxisCount: 2,
                                ),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.all(2),
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: const DecorationImage(
                                            image: NetworkImage(
                                                'https://images.unsplash.com/photo-1658064273537-84ae941402b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
                                            fit: BoxFit.fill,
                                            opacity: 1)),
                               
                                  );
                                },
                              )));
                    }
                  }),
            )
          ],
        ));
  }

//search result card
  Widget HomeCard_search_result(ExersiceModel exersiceModel, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SelectTime_Screen(index: index)));
      },
      child: Container(
        margin: EdgeInsets.all(2),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: NetworkImage(exersiceModel.thumbnail.toString()),
                fit: BoxFit.fill,
                opacity: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                exersiceModel.title.toString(),
                style: TextStyle(fontSize: 14, color: Colors.brown[100]),
              ),
            ),
          ],
        ),
      ),
    );
  }

//noram data without search

  Widget HomeCard_without_search_result(ApiProvider data, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SelectTime_Screen(index: index)));
      },
      child: Container(
        margin: EdgeInsets.all(2),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image:
                    NetworkImage(data.fitnessData[index].thumbnail.toString()),
                fit: BoxFit.fill,
                opacity: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                data.fitnessData[index].title.toString(),
                style: TextStyle(fontSize: 14, color: Colors.brown[100]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
