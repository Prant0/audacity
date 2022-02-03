class PhotoModel {
  PhotoModel({
     this.id,
     this.author,
     this.width,
     this.height,
     this.url,
     this.downloadUrl,
  });

  final String? id;
  final String ?author;
  final int ?width;
  final int ?height;
  final String? url;
  final String ?downloadUrl;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    id: json["id"],
    author: json["author"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
    downloadUrl: json["download_url"],
  );


}
