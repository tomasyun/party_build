import 'package:flutter/material.dart';
import 'package:party_build/bloc/sign_in_bloc.dart';
import 'package:party_build/bloc/sign_info_bloc.dart';
import 'package:party_build/global/toast.dart';
import 'package:party_build/model/response_rst_model.dart';
import 'package:party_build/model/sign_info_model.dart';
import 'package:simple_permissions/simple_permissions.dart';

//签到
class SignPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignPageState();
}

//String getLocationStr(AMapLocation loc) {
//  if (loc == null) {
//    return "正在定位";
//  }
//
//  if (loc.isSuccess()) {
//    if (loc.hasAddress()) {
//      return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n 地址:${loc.formattedAddress} 城市:${loc.city} 省:${loc.province}";
//    } else {
//      return "定位成功: \n时间${loc.timestamp}\n经纬度:${loc.latitude} ${loc.longitude}\n ";
//    }
//  } else {
//    return "定位失败: \n错误:{code=${loc.code},description=${loc.description}";
//  }
//}

class SignPageState extends State<SignPage> with SignInBloc {
  String location;
  SignInfoBloc _bloc = SignInfoBloc.newInstance;

  @override
  void initState() {
    super.initState();
    _bloc.doGetSignInfoRequest();
//    AMapLocationClient.startup(new AMapLocationOption(
//        desiredAccuracy: CLLocationAccuracy.kCLLocationAccuracyHundredMeters));
//    location = getLocationStr(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "签到",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: null,
        backgroundColor: Colors.red,
      ),
      body: _buildSignInfoContent(),
    );
  }

  Widget _buildSignInfoBody(SignInfo info) {
    if (info.code == "0000") {
      return SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200.0,
                child: FadeInImage.assetNetwork(
                  placeholder: "images/app_def.png",
                  image: info.data.themeImg,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/ic_clock.png"),
                      width: 16.0,
                      height: 16.0,
                      margin: EdgeInsets.only(top: 3.0),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                              info.data.startDate,
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black45),
                            ),
                          ),
                          Container(
                            child: Text(
                              "星期五",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black45),
                            ),
                            padding: EdgeInsets.only(left: 15.0),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Text(
                              "上午12:00",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.black45),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image.asset("images/ic_location.png"),
                      width: 16.0,
                      height: 16.0,
                      margin: EdgeInsets.only(top: 3.0),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.0),
                        child: Text(
                          info.data.address,
                          style: TextStyle(fontSize: 14.0, color: Colors.red),
                          maxLines: 2,
                        ),
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    //1 开始定位
                    _checkPermission();
                  },
                  child: Container(
                    padding: EdgeInsets.all(50.0),
                    margin: EdgeInsets.only(top: 60.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: _buildBtnText(info.data.type),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Text("暂无签到"),
        ),
      );
    }
  }

  Widget _buildBtnText(String type) {
    if (type == "0") {
      return Text(
        "会议签到",
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      );
    } else {
      return Text(
        "活动签到",
        style: TextStyle(fontSize: 14.0, color: Colors.white),
      );
    }
  }

  Widget _buildSignInfoContent() {
    return _bloc.streamBuild(loading: () {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red),
          ),
        ),
      );
    }, success: (data) {
      return _buildSignInfoBody(data);
    }, empty: () {
      return Container(
        child: Center(
          child: Text("暂无数据"),
        ),
      );
    }, error: (msg) {
      return Container(
        child: Center(
          child: Text(msg),
        ),
      );
    });
  }

  void _checkPermission() async {
    bool hasPermission =
        await SimplePermissions.checkPermission(Permission.WhenInUseLocation);
    if (!hasPermission) {
      PermissionStatus requestPermissionResult =
          await SimplePermissions.requestPermission(
              Permission.WhenInUseLocation);
      if (requestPermissionResult != PermissionStatus.authorized) {
        GlobalToast.showToast("申请定位权限失败");
        return;
      }
    }
//    AMapLocationClient.onLocationUpate.listen((AMapLocation loc) {
//      if (!mounted) return;
//      setState(() {
//        location = getLocationStr(loc);
//        print(location);
//      });
//    });
//
//    AMapLocationClient.startLocation();
  }

  @override
  void dispose() {
    //注意这里关闭
//    AMapLocationClient.stopLocation();
//    AMapLocationClient.shutdown();
    super.dispose();
  }

  @override
  void onSuccess(ResponseRstModel model) {}
}
