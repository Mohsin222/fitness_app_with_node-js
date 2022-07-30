import 'package:fitness_app/pages/homepage.dart';
import 'package:fitness_app/pages/splash.dart';
import 'package:fitness_app/providers/api_provider.dart';
import 'package:fitness_app/providers/wallpaper_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(  create: (_) => ApiProvider(),),
                ChangeNotifierProvider(  create: (_) => WallpaperProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
     scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.blue,
          
        ),
        themeMode: ThemeMode.dark,
        home: Splash_Screen(),
      ),
    );
  }
}

