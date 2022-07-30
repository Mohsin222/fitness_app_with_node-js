import 'dart:async';

//import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:fitness_app/providers/api_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

enum PlayerState { stopped, playing, paused }

class ExersiceScreen extends StatefulWidget {
  final index;
  int seconds;
  ExersiceScreen({Key? key, this.index, required this.seconds})
      : super(key: key);

  static const countdownDuration = Duration(minutes: 10);

  @override
  State<ExersiceScreen> createState() => _ExersiceScreenState();
}

class _ExersiceScreenState extends State<ExersiceScreen> {
  Timer? timer;
  final player = AudioPlayer();
  int _elapsedSeconds = 0;
  bool _iscomplete = false;



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  AudioCache player1 = AudioCache();



  bool isPlaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  exersiceTimer();
  }

  void exersiceTimer(){
      timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (t.tick == widget.seconds) {
        timer!.cancel();
        _iscomplete = true;
      }

      setState(() {
        _elapsedSeconds = t.tick;
      });
    });
  }

  dynamic kUrl =
      "https://www.mediacollege.com/downloads/sound-effects/nature/forest/rainforest-ambient.mp3";
  Future play1() async {
    Future<void> s = player.setSourceUrl(
        kUrl); // player.setSource(AssetSource('sounds/assets_note1.wav')) as Source;
    await player.play(s as Source);
    // setState(() {
    //   playerState = PlayerState.playing;
    // });
  }

  @override
  Widget build(BuildContext context) {
    final apiData = Provider.of<ApiProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          timer!.cancel();
          Navigator.pop(context);
        },
        child: Icon(
          Icons.close,
          size: 25,
          color: Colors.black,
        ),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Text(
            _elapsedSeconds.toString(),
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
          Visibility(
            visible: !_iscomplete,
            child: Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          apiData.fitnessData[widget.index].gif.toString()),
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.medium),
                )),
          ),
//           ElevatedButton(
//               onPressed: () async {
// // String url ='https://www.nch.com.au/acm/8k16bitpcm.wav' ;
// // dynamic u =player.setSourceUrl(url); // equivalent t

// // await player.play(u);
//                 print('n nnnn');
//                 await play1();
//               },
//               child: Text('aaaa'))
        ],
      )),
    );
  }
}
