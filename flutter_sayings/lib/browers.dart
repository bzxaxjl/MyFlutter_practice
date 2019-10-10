import 'package:flutter/material.dart';
import 'package:flutter_sayings/Widgets/douyin.dart';
import 'data.dart';
import 'dart:math';

import 'Slidedrawer/drawer.dart';
import 'Slidedrawer/slide_container.dart';

//void main() => runApp(MaterialApp(
//  home: MyApp(),
//  debugShowCheckedModeBanner: false,
//));
class MainTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Tabs(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabState createState() => _TabState();
}

class _TabState extends State<Tabs> {
  int _currentIndex = 0;
  double position = 0.0;
  double height = 0.0;

  double get maxSlideDistance =>
      MediaQuery
          .of(context)
          .size
          .width * 0.7;

  final GlobalKey<ContainerState> _slideKey = GlobalKey<ContainerState>();

  void onSlide(double position) {
    setState(() => this.position = position);
  }
    List _pageList = [
      MainBrower(),
      DouYin(),
    ];
    @override
    Widget build(BuildContext context) {                                        //主界面设计
      double statusBarHeight = MediaQuery
          .of(context)
          .padding
          .top;
      height = MediaQuery
          .of(context)
          .size
          .height - statusBarHeight;

      return Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        child: SlideStack(
          drawer: DrawerPage(),                                                 //绘制抽屉
          child: SlideContainer(
            key: _slideKey,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: height * (1 - position / 5),
              child: Column(
                children: <Widget>[
//                  CustomAppBar(
//                    title: 'Slide Drawer',
//                    height: kToolbarHeight * (1 - position / 5),
//                    tapDrawer: () {
//                      _slideKey.currentState.openOrClose();
//                    },
//                  ),
                  Expanded(                                                     //原始主界面
                    child: Scaffold(
                      bottomNavigationBar: BottomNavigationBar(
                          currentIndex: this._currentIndex,
                          onTap: (int index) {
                            // print(index);
                            setState(() {
                              this._currentIndex = index;
                            });
                          },
                          iconSize: 36.0,
                          type: BottomNavigationBarType.fixed,
                          fixedColor: Color(0xFFfa7b58),
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(Icons.panorama_horizontal,size: 35,),
                                title: Container(
                                  height: 0.0,
                                )),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.videocam,size: 35,),
                                title: Container(
                                  height: 0.0,
                                ))
                          ]),
                      floatingActionButton: Container(                          //浮动点击
                        width: 65.0,
                        height: 65.0,
                        decoration: BoxDecoration(
                            color: Color(0xFFfa7b58),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFf78a6c).withOpacity(.6),
                                  offset: Offset(0.0, 10.0),
                                  blurRadius: 10.0)
                            ]),
                        child: RawMaterialButton(
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.add,
                            size: 35.0,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                      body: this._pageList[this._currentIndex],
//      drawer: Drawer(
//        child: Column(
//          children: <Widget>[
//            Text("456"),
//          ],
//        ),
//      ),
                    ),
                  ),
//                  WillPopScopeTestRoute(),                                      //点击两次推出，拦截器
                ],
              ),
            ),
            slideDirection: SlideDirection.left,
            onSlide: onSlide,
            drawerSize: maxSlideDistance,
            transform:
            Matrix4.translationValues(0.0, height * position / 10, 0.0),
          ),
        ),
      );
    }
  }

class MainBrower extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class _MyAppState extends State<MainBrower> {
  var currentPage = images.length - 1.0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
//                Colors.blueAccent,
//                Colors.blue[800],

                Color(0xFF1b1e44),//渐变色
                Color(0xFF2d3447),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(

        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 15.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
//                    顶部的bar
//                    IconButton(
//                      icon: Icon(
//                        Icons.menu,
//                        color: Colors.white,
//                        size: 30.0,
//                      ),
//                      onPressed: () {
//                      },
//                    ),
//                    IconButton(
//                      icon: Icon(
//                        Icons.search,
//                        color: Colors.white,
//                        size: 30.0,
//                      ),
//                      onPressed: () {},
//                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("记语",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: 1.0,
                        )),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 23.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFff6e6e),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text("关注",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text("25+ 语录",
                        style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("收藏",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: 1.0,
                        )),
                    IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 23.0,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.0, vertical: 6.0),
                          child: Text("最新",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text("9+ 语录",
                        style: TextStyle(color: Colors.blueAccent))
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
//              Stack(
//                children: <Widget>[
//                  CardScrollWidget(currentPage),
//                  Positioned.fill(
//                    child: PageView.builder(
//                      itemCount: images.length,
//                      controller: controller,
//                      reverse: true,
//                      itemBuilder: (context, index) {
//                        return Container();
//                      },
//                    ),
//                  )
//                ],
//              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/image_04.jpg",
                          width: 296.0, height: 222.0),
                    ),
                  )
                ],
              )
            ],

          ),

        ),
//        bottomNavigationBar: BottomAppBar(//测试抖音bottom
//          child:Container(
//            height:60,
//            decoration: BoxDecoration(
//              color: Colors.black,
//            ),
//            child: BtmBar(),
//          ),
//        ),
      //TODO:单页面的 bottomNavigationBar
//        bottomNavigationBar: BottomNavigationBar(
//          selectedItemColor: Colors.black,
//          onTap: (index) {
//            setState(() {
//              _currentIndex = index;
//            });
//          },
//          currentIndex: _currentIndex,
//          items: [
//            BottomNavigationBarItem(
//                icon: Icon(Icons.panorama_horizontal,size: 35,),
//                title: Container(
//                  height: 0.0,
//                )),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.videocam,size: 35,),
//                title: Container(
//                  height: 0.0,
//
//                ))
//          ],
//        ),
//        floatingActionButton: Container(//浮动点击
//          width: 65.0,
//          height: 65.0,
//          decoration: BoxDecoration(
//              color: Color(0xFFfa7b58),
//              shape: BoxShape.circle,
//              boxShadow: [
//                BoxShadow(
//                    color: Color(0xFFf78a6c).withOpacity(.6),
//                    offset: Offset(0.0, 10.0),
//                    blurRadius: 10.0)
//              ]),
//          child: RawMaterialButton(
//            shape: CircleBorder(),
//            child: Icon(
//              Icons.add,
//              size: 35.0,
//              color: Colors.white,
//            ),
//            onPressed: () {},
//          ),
//        ),
//        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

//抖音bottom实现代码，文字和icon
//class BtmBar extends StatelessWidget {
//  const BtmBar({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          getBtmTextWidget("首页",true),
//          getBtmTextWidget("同城",false),
//          AddIcon(),
//          getBtmTextWidget("消息",false),
//          getBtmTextWidget("我",false),
//        ],
//      ),
//    );
//  }
//}
//class AddIcon extends StatelessWidget {
//  const AddIcon({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      height: 35,
//      width: 60,
//      child: Stack(
//        children: <Widget>[
//          Positioned(
//            height: 35,
//            width: 50,
//            child: Container(
//              decoration: BoxDecoration(color: Colors.cyan,borderRadius: BorderRadius.circular(10)),
//            ),
//          ),
//          Positioned(
//            height: 35,
//            width: 50,
//            right: 0,
//            child: Container(
//              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10)),
//            ),
//          ),
//          Positioned(
//            height: 35,
//            width: 50,
//            right: 5,
//            child: Container(
//              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
//              child: Icon(Icons.add),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}


getBtmTextWidget(String content,bool ifSelected){
  return Text("$content",style: ifSelected?TextStyle(fontSize: 20,
      color: Colors.white):TextStyle(fontSize: 20,color: Colors.grey[700]),);
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "SF-Pro-Text-Regular")),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0, bottom: 12.0),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 22.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text("点击阅读",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
//class WillPopScopeTestRoute extends StatefulWidget {                            //点击两次推出，拦截器
//  @override
//  WillPopScopeTestRouteState createState() {
//    return new WillPopScopeTestRouteState();
//  }
//}
//
//class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
//  DateTime _lastPressedAt; //上次点击时间
//
//  @override
//  Widget build(BuildContext context) {
//    return new WillPopScope(
//        onWillPop: () async {
//          if (_lastPressedAt == null ||
//              DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
//            //两次点击间隔超过1秒则重新计时
//            _lastPressedAt = DateTime.now();
//            return false;
//          }
//          return true;
//        },
//
//    );
//  }
//}