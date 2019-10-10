import 'package:flutter/material.dart';
import 'dart:ui';                                                               //高斯模糊

class _MenuInfo {
  final String title;
  final IconData icon;

  _MenuInfo({this.title, this.icon});
}

final List<_MenuInfo> menus = [
  _MenuInfo(title: '了解会员特权', icon: Icons.accessibility),
  _MenuInfo(title: '记语钱包', icon: Icons.account_box),
  _MenuInfo(title: '个性装扮', icon: Icons.format_paint),
  _MenuInfo(title: '我的相册', icon: Icons.photo_album),
];

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.plus,
          image: DecorationImage(
              image: AssetImage('assets/img01.jpg'), fit: BoxFit.fill),
          color: Colors.white),
      child: new BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: new Container(
          padding: EdgeInsets.only(top: 80.0, left: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    child: FlutterLogo(
                      colors: Colors.blue,
                      size: 30,                                                 //图标大小
                    ),
                    radius: 30.0,                                               //CircleAvatar大小
                    backgroundColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      '记语用户',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: menus.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 60.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Icon(
                                menus[index].icon,
                                color: Colors.white,
                              ),
                            ),
                            Center(
                              child: Text(
                                menus[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.25)),
        ),
      ),
    );
  }
}