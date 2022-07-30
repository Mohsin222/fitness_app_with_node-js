import 'dart:ui';

import 'package:fitness_app/pages/exersice_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../providers/api_provider.dart';

class SelectTime_Screen extends StatelessWidget {
  final int index;
   SelectTime_Screen({Key? key, required this.index});

  double time=12;

  @override
  Widget build(BuildContext context) {
        final apiData= Provider.of<ApiProvider>(context,listen:false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[300],
        onPressed: (){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>ExersiceScreen(index: index,seconds: time.toInt(),)));
      },
       child: Icon(Icons.play_arrow,color: Colors.black,size: 34,),
      ),
      //appBar: AppBar(title: Text(apiData.fitnessData[index].title.toString())),
      body: Container(
        width: MediaQuery.of(context).size.width,
      //  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/10),
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(apiData.fitnessData[index].thumbnail.toString()),fit: BoxFit.fill,filterQuality: FilterQuality.medium),
    
      
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/10,
            ),
            Card(
          elevation: 10,
          color: Colors.black.withOpacity(0.5),
          child:  SizedBox(
            width: MediaQuery.of(context).size.width/1.3,
            height:  MediaQuery.of(context).size.height/4,
            
            child: Container(decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(apiData.fitnessData[index].thumbnail.toString(),),
            
            ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(apiData.fitnessData[index].title.toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                 Text('Standard time  ${apiData.fitnessData[index].seconds.toString()}sec',style: TextStyle(color: Colors.white,fontSize: 15),)
              ],
            ),),
          ),
        ),
        Spacer(),
        Container(
 
child: SleekCircularSlider(
  
    appearance: CircularSliderAppearance(
      infoProperties: InfoProperties(mainLabelStyle: TextStyle(color: Colors.white,fontSize: 20)),
    customWidths: CustomSliderWidths(progressBarWidth: 10,),
    customColors: CustomSliderColors(dotColor: Colors.red,),

    ),
  min: 10,
  max: 100,
  
  initialValue: time,
  onChange: (double value) {
    // callback providing a value while its being changed (with a pan gesture)
    time=value;
  },
  onChangeStart: (double startValue) {
    // callback providing a starting value (when a pan gesture starts)
  },
  onChangeEnd: (double endValue) {
    // ucallback providing an ending value (when a pan gesture ends)
  },
  // innerWidget: (double value) {
  //   // use your custom widget inside the slider (gets a slider value from the callback)
  // },
),
        ),
          ],
        ),
      )
      ),
    );
  }
}