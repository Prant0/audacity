import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';



class ViewPhotos extends StatefulWidget {
   ViewPhotos({Key? key,this.photo}) : super(key: key);
  String ?photo;

  @override
  _ViewPhotosState createState() => _ViewPhotosState();
}

class _ViewPhotosState extends State<ViewPhotos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          CachedNetworkImage(
            height: double.infinity,
            fit: BoxFit.cover,
               imageUrl: "${widget.photo}",
            placeholder: (context, url) => Image(image: AssetImage("asset/placeholder.png")),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
                },
              icon:Icon(Icons.arrow_back_ios,size: 28,color: Colors.white,)),
          ),

          Positioned(
              bottom: 50,right: 0,left: 0,
              child: InkWell(
                onTap: (){
                  setWallpaperFromFile();
                  showInToast("Successfully done");
                },
                child: Container(
                  alignment: Alignment.center,
            color: Colors.blue,
            width: 100,height: 50,
            child: Text("Set as WallPaper",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
          ),
              ))
        ],
      ),
    );
  }

  Future<void> setWallpaperFromFile() async {
    String ?result;
    var file = await DefaultCacheManager().getSingleFile("${widget.photo}");
    try {
      result = await WallpaperManager.setWallpaperFromFile(
          file.path, WallpaperManager.HOME_SCREEN);
    } on PlatformException {
      showInToast("Failed to get wallpaper");
      result = 'Failed to get wallpaper.';
    }
    if (!mounted) return;
  }
  showInToast(String value) {
    Fluttertoast.showToast(
        msg: "$value",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.red,
        fontSize: 16.0);
  }
}
