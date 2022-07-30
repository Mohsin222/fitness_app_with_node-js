class ExersiceModel{
  String? title;
  String? thumbnail;
  String? gif;
String? seconds;
String? id;

ExersiceModel({this.id,this.title,this.thumbnail,this.gif,this.seconds});

ExersiceModel.fromJson(dynamic json){
  id =json['id'];
  thumbnail=json['thumbnail'];
  gif=json['gif'];
  seconds=json['seconds'];
  title=json['title'];
}


}