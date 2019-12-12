import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_beginner/model/login_model.dart';
import 'package:flutter_app_beginner/pages/page_indicator.dart';
import 'data.dart';

class MyAppState extends StatefulWidget {
  @override
  _MyAppStateState createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  PageController _controller;
  int currentpage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentpage);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xFF485563), Color(0xFF29313C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            stops: [0.0, 1.0]),
      ),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentpage = index;
                });
              },
              itemBuilder: (countext, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        var page = pageList[index];
                        return Stack(
                          alignment: Alignment.bottomLeft,
                          children: <Widget>[
                            Image.asset(page.imageUrl,fit: BoxFit.fill,height: double.infinity,),
                            Container(
                              margin: EdgeInsets.only(bottom: 50),
                              height: 100,
                              child: Stack(
                                children: <Widget>[
                                  Opacity(
                                    child: Text(
                                      page.title,
                                      style: TextStyle(
                                          fontSize: 100.0,
                                          fontFamily: "Montserrat-Black",
                                          letterSpacing: 1.0),
                                    ),
                                    opacity: .10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30.0, left: 22.0),
                                    child: Text(
                                      page.title,
                                      style: TextStyle(
                                          fontSize: 70.0,
                                          fontFamily: "Montserrat-Black",
                                          letterSpacing: 1.0),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 12.0, left: 34.0),
                              child: Text(
                                page.body,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: "Montserrat-Medium",
                                    color: Color(0xFF9B9B9B)),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                );
              },
            ),
            Positioned(
              left: 30.0,
              bottom: 55.0,
              child: Container(
                  width: 160,
                  child: PageIndicator(currentpage, pageList.length)),
            )
          ],
        ),
      ),
    );
  }
}