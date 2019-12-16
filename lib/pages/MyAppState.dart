import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app_beginner/model/login_model.dart';
import 'package:flutter_app_beginner/pages/page_indicator.dart';
import 'data.dart';

class MyAppState extends StatefulWidget {
  @override
  _MyAppStateState createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> with TickerProviderStateMixin {
  PageController _controller;
  AnimationController animationController;
  Animation<double> _scaleAnim;
  int currentpage = 0;
  bool lastPage = false;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentpage);
    animationController =
        AnimationController(duration: Duration(microseconds: 300), vsync: this);
    _scaleAnim = Tween(begin: 0.6, end: 1.0).animate(animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    animationController.dispose();
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
                  if (currentpage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                  }
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
                        var delta;
                        var y = 1.0;
                        if (_controller.position.haveDimensions) {
                          delta = _controller.page - index;
                          y = 1 - delta.abs().clamp(0.0, 1.0);
                        }
                        return Stack(
                          alignment: Alignment.bottomLeft,
                          children: <Widget>[
                            Image.asset(
                              page.imageUrl,
                              fit: BoxFit.fill,
                              height: double.infinity,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 100),
                              height: 100,
                              child: Stack(
                                children: <Widget>[
                                  Opacity(
                                    child: Container(
                                      color: Colors.white,
                                      child: Text(
                                        page.title,
                                        style: TextStyle(
                                            fontSize: 100.0,
                                            fontFamily: "Montserrat-Black",
                                            letterSpacing: 1.0),
                                      ),
                                    ),
                                    opacity: .10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30.0, left: 22.0),
                                    child: Container(
                                      child: Text(
                                        page.title,
                                        style: TextStyle(
                                            fontSize: 70.0,
                                            fontFamily: "Montserrat-Black",
                                            letterSpacing: 1.0),
                                      ),
                                      color: Color.fromARGB(100, 100, 100, 100),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 70),
                              padding: EdgeInsets.only(top: 12.0, left: 34.0),
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    0, 50 * (1 - y), 0.0),
                                child: Text(
                                  page.body,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: "Montserrat-Medium",
                                      color: Color(0xFF9B9B9B)),
                                ),
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
            ),
            Positioned(
              right: 30.0,
              bottom: 30.0,
              child: lastPage
                  ? FloatingActionButton(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),onPressed: (){

              },)
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
