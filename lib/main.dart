import 'package:flutter/material.dart';
import 'package:flutter_app_beginner/pages/camera_page.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    requestPermiss();
    return Container(
      child: MaterialApp(
        home: ImagePickerWidget(),
      ),
    );
  }

  requestPermiss() async {
    //请求权限
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler()
        .requestPermissions([PermissionGroup.camera,PermissionGroup.microphone,PermissionGroup.photos,PermissionGroup.storage]);
    //校验权限
    if(permissions[PermissionGroup.camera] != PermissionStatus.granted){
      print("无照相权限");
    }
    if(permissions[PermissionGroup.location] != PermissionStatus.granted){
      print("无定位权限");
    }
  }
}