import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'camera_page.dart';

class WxPage extends StatefulWidget {
  @override
  _WxPageState createState() => _WxPageState();
}

class _WxPageState extends State<WxPage> {
  bool wx = true;
  String count;

  @override
  void initState() {
    super.initState();
    fluwx.registerWxApi(
        appId: "wxe6186d1fcdee4b94",
        doOnAndroid: true,
        doOnIOS: false,
        universalLink:
        "https://www.jianshu.com/u/196d445e5c39");
    fluwx.sendAuth(
        scope: "snsapi_userinfo",
        state: "wechat_sdk_demo_test");
    fluwx.isWeChatInstalled().then((value){
      print("============是否安装微信=============${value}");
    });

  }

  @override
  Widget build(BuildContext context) {
    if (wx) {
      return Container(
        child: MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                  ),
                  GestureDetector(
                    child: Text("微信登录"),
                    onTap: (() {
                      setState(() {
                        fluwx.responseFromAuth.listen((response) {
                          //监听授权登录回调
                          Fluttertoast.showToast(msg: "=====${response.code}=====\n=====${response.errStr}=====");
                          count = response.toString();
//                          print("code: ========androidOpenId==========" + response.androidOpenId);
//                          print("code: ========iOSDescription==========" + response.iOSDescription);
                          print("code: ========code==========${response.code}");
                          print("iOSDescription: ========iOSDescription==========${response.iOSDescription}");
                          print("androidOpenId: ========androidOpenId==========${response.androidOpenId}");
                          print("errCode: ========errCode==========${response.errCode}");
                          print("errStr: ========errStr==========${response.errStr}");
                        });
//                    wx = false;
                      });
                    }),
                  ),
                  Text("${count}",style: TextStyle(fontSize: 30),),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        child: MaterialApp(
          home: ImagePickerWidget(),
        ),
      );
    }
  }
}
