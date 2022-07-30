import 'package:fitness_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class Splash_Screen extends StatelessWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://images.unsplash.com/photo-1602489053809-4d912f6c8b4d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQ1fHxneW18ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),fit: BoxFit.fill,)),
        child: Column(

children: [
  Spacer(),
  Container(
    alignment: Alignment.centerLeft,
    child: Text(
      'Welcome!',
      
      
      style: TextStyle(color: Colors.white,fontSize: 38,fontWeight: FontWeight.bold,),),
  ),
   

  Container(
    decoration: BoxDecoration(color: Color(0xffff1b18),
    borderRadius: BorderRadius.circular(40)
    ),
    height: MediaQuery.of(context).size.height/15,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
    child: ElevatedButton(onPressed: (){

      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }, child: Text('Next',style: TextStyle(fontSize: 23,letterSpacing: 2),),
    style: ElevatedButton.styleFrom(
      primary: Color(0xffff1b18)
   
      
    ),
    ))
],
      )),
    );
  }
}