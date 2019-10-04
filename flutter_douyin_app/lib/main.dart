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
          decoration: BoxDecoration(color: Colors.grey),
          child: Home(),
        ),
        bottomNavigationBar: BottomAppBar(
          child:Container(
            height:60,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: BtmBar(),
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [

        Positioned(
          top: 0,
          height: 120,
          width: screenWidth,
          child: Container(
//            decoration: BoxDecoration(color: Colors.deepPurpleAccent),
             child: TopTab(),
          ),
        ),
        Positioned(//左边文字框
          bottom: 0,
          width: 0.70*screenWidth,
          height: 150,
          child: Container(
//            decoration: BoxDecoration(color: Colors.deepOrange),
            child: BtmContent(),
          ),
        ),
        Positioned(//右边侧栏
          right: 0,
          width: 0.25*screenWidth,
          height: 0.4*screenHeight,
          top: 0.3*screenHeight,
          child: Container(
//            decoration: BoxDecoration(color: Colors.lightBlueAccent,
//            ),
            child: getButtonList(),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 0,
          width: 0.25*screenWidth,
          height: 0.25*screenWidth,
          child: Container(
//            decoration: BoxDecoration(color: Colors.grey),
            child: RotateAlbum(),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Row(
            children: <Widget>[
              SizedBox(width: 20,),
              Icon(Icons.search,size: 35,color: Colors.white,),
            ],
          )
        ),
        Expanded(
          flex: 8,
          child:Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            width: 240,
            child: TabBar(
              indicatorColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white,fontSize: 22),
              unselectedLabelStyle: TextStyle(color: Colors.grey[400],fontSize: 20),
              controller: _controller,
              tabs: <Widget>[Text("关注"),Text("推荐")],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: <Widget>[
              SizedBox(width: 10,),
              Icon(Icons.live_tv,size: 35,color: Colors.white,
              ),
            ],
          )
        ),
      ],
    );
  }
}
class BtmBar extends StatelessWidget {
  const BtmBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          getBtmTextWidget("首页",true),
          getBtmTextWidget("同城",false),
          AddIcon(),
          getBtmTextWidget("消息",false),
          getBtmTextWidget("我",false),
        ],
      ),
    );
  }
}

getBtmTextWidget(String content,bool ifSelected){
  return Text("$content",style: ifSelected?TextStyle(fontSize: 20,
  color: Colors.white):TextStyle(fontSize: 20,color: Colors.grey[700]),);
}

class AddIcon extends StatelessWidget {
  const AddIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 60,
      child: Stack(
        children: <Widget>[
          Positioned(
            height: 35,
            width: 50,
            child: Container(
              decoration: BoxDecoration(color: Colors.cyan,borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            height: 35,
            width: 50,
            right: 0,
            child: Container(
              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            height: 35,
            width: 50,
            right: 5,
            child: Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
class BtmContent extends StatelessWidget {
  const BtmContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: <Widget>[
          ListTile(title: Text("人民日报",style: TextStyle(color: Colors.white),),
            subtitle: Text(
            "LoginPage()是写好的用户登录界面，但是想让界面跑起来 需要runApp()，"
                "需要再写个MyApp()里面使用MaterialApp（）包裹写好的界面，这样才可以运行。",
                style: TextStyle(color: Colors.white),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
          ),),
          Row(
            children: <Widget>[
              SizedBox(width: 10,),
              Icon(Icons.music_note),
//              Marquee(text: "人命日报创建的奇奇怪怪的文件和作文"),
            ],
          )
        ],
      ),
    );
  }
}
class RotateAlbum extends StatefulWidget {
  RotateAlbum({Key key}) : super(key: key);

  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum>with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 4));
    //旋转动画，2秒一圈
    animation = RotationTransition(
      turns: Tween(begin: 0.0,end: 1.0).animate(_controller)
      ..addStatusListener((status){//控制图标一直旋转
      if(status==AnimationStatus.completed){
        _controller.forward(from: 0.0);
      }
    }),
    child:Container(
        width: 60,
        height: 60,
        child:CircleAvatar(backgroundImage: NetworkImage("https://i0.hdslb.com/bfs/album/8450202c624418a1bab398811c8240513474b981.jpg"),)
    )
    );
    _controller.forward(from: 0.0);
  }
  @override

  Widget build(BuildContext context) {
    return Container(
      child: animation,
      padding: EdgeInsets.all(15),
    );
  }
}
getButtonList(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[

    Container(
      width: 60,
      height: 70,
      child: Stack(
          children: <Widget>[
            Container(//这里包一层让CircleAvatar变大，修改属性
              width: 60,
              height: 60,
              child: CircleAvatar(//环形头像
                backgroundImage: NetworkImage("https://i0.hdslb.com/bfs/album/786d66f2c98102d3668e9c008d6a135aeb4aa274.jpg@518w_1e_1c.jpg"),),
            ),
              Positioned(//控制icon的位置
                bottom: 0,
                left: 19,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.add),
                ),
              ),
          ],
      ),
    ),
      IconText(text: "999w",icon: Icon(Icons.favorite,size: 50,
      color: Colors.redAccent,),),
      IconText(text: "999w",icon: Icon(Icons.feedback,size: 50,
      color: Colors.white,),),
      IconText(text: "999w",icon: Icon(Icons.reply,size: 50,
      color: Colors.white,),),
    ],
  );
}
class IconText extends StatelessWidget {
  const IconText({Key key,this.icon,this.text}) : super(key: key);

  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          Text(text,style:
            TextStyle(color: Colors.white),),
        ],
      ),
    );
  }
}
