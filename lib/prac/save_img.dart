import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_downloader/image_downloader.dart';

class ImgDown extends StatefulWidget {
  const ImgDown({Key? key}) : super(key: key);

  @override
  State<ImgDown> createState() => _ImgDownState();
}

class _ImgDownState extends State<ImgDown> {

  downloadImg()async{
    try {
  // Saved with this method.
  var imageId = await ImageDownloader.downloadImage("https://images.unsplash.com/photo-1555817128-342e1c8b3101?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTE4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
  destination: AndroidDestinationType.directoryDownloads..subDirectory("fitness_app/flutter_image.png")
  );

  print('iamge download success');
  if (imageId == null) {
    return;
  }

  // Below is a method of obtaining saved image information.
  var fileName = await ImageDownloader.findName(imageId);
  var path = await ImageDownloader.findPath(imageId);
  var size = await ImageDownloader.findByteSize(imageId);
  var mimeType = await ImageDownloader.findMimeType(imageId);
  
} on PlatformException catch (error) {
  print(error);
}

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Download Image'),
      leading: IconButton(onPressed: (){
        downloadImg();
      }, icon: Icon(Icons.add)),
      ),

      
    );
  }
}