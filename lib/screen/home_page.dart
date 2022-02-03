import 'package:audacity/widget/photo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<PhotoProvider>(context, listen: false).getAllPhotos(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final photos = Provider.of<PhotoProvider>(context).photoList;
    return Scaffold(

    );
  }
}
