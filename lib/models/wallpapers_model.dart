class WallpapersClass{
  String? wallpapers;

  WallpapersClass({this.wallpapers});

  WallpapersClass.fromJson(dynamic json){
    wallpapers=json['title'];
  }


}