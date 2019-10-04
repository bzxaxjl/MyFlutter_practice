import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({Key key}): super (key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "抖音",
      home:Scaffold(
        body:Container(
          decoration: BoxDecoration(color: Colors.lightGreen),
          child: Home(),
        ),
        bottomNavigationBar: BottomAppBar(
          child:Container(
            height:80,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
class Home extends StatelessWidget{
  const Home({Key key}): super (key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          top: 0,
          height: 150,
          width: screenwidth,
          child: Container(
          decoration: BoxDecoration(color: Colors.deepPurpleAccent),
           // child: TopTab(),
          ),
        ),
        Positioned(//左边文字框
          bottom: 0,
          width: 0.70*screenwidth,
          height: 150,
          child: Container(
            decoration: BoxDecoration(color: Colors.deepOrange),
          ),
        ),
        Positioned(//右边侧栏
          right: 0,
          width: 0.25*screenwidth,
          height: 0.4*screenheight,
          top: 0.3*screenheight,
          child: Container(
            decoration: BoxDecoration(color: Colors.lightBlueAccent),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          width: 0.25*screenwidth,
          height: 0.25*screenwidth,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey),
          ),
        )

      ],
    );
  }
}
class TopTab extends StatefulWidget {
  TopTab({Key key}) : super(key: key);

  _TopTabState createState() => _TopTabState();
}
@override

class _TopTabState extends State<TopTab>  with SingleTickerProviderStateMixin{
  TabController _controller;
  @override
  void initState() { 
  super.initState();
  _controller = TabController(vsync: this,length: 2,initialIndex: 1);
}
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Icon(
            Icons.search
          ),
        ),
        Expanded(
          flex: 8,
          child: TabBar(
            controller: _controller,
            tabs: <Widget>[Text("关注"),Text("推荐")],
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(Icons.live_tv),
        ),
      ],
    );
  }
}
class RotateAlbum extends StatefulWidget {
  RotateAlbum({Key key}) : super(key: key);

  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: child,
    );
  }
}