import 'package:audacity/screen/view_photos.dart';
import 'package:audacity/widget/photo_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
  if(mounted){
    Provider.of<PhotoProvider>(context, listen: false).getAllPhotos(context);
  }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final photos = Provider.of<PhotoProvider>(context).photoList;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        child:photos.isEmpty?Center(child: CircularProgressIndicator()):SingleChildScrollView(
          child: Column(
            children: [
              StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: photos.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 12),
                itemBuilder: (BuildContext context, int index) => ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ViewPhotos(photo: "${photos[index].downloadUrl}",),fullscreenDialog: true));
                      },
                      child:Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "${photos[index].downloadUrl}",
                            placeholder: (context, url) => Image(image: AssetImage("asset/placeholder.png")),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              padding: EdgeInsets.only(left: 10,bottom: 12,top: 10),
                                //height: 34,
                               width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,

                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black
                                    ]
                                  )
                                ),
                                child: Text("${photos[index].author}",style: TextStyle(fontSize: 13,color: Colors.white),)),
                          ),
                        ],
                      ),
                  ),
                ),
                staggeredTileBuilder: (int index) =>StaggeredTile.fit(1),
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
              )
            ],
          ),
        ) ,
      ),
    );
  }
}
