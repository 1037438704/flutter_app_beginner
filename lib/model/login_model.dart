class LoginModel {
  String _id;
  int _time;
  Data _data;

  login({String id, int time, Data data}) {
    this._id = id;
    this._time = time;
    this._data = data;
  }

  String get id => _id;

  set id(String id) => _id = id;

  int get time => _time;

  set time(int time) => _time = time;

  Data get data => _data;

  set data(Data data) => _data = data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _time = json['time'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['time'] = this._time;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class Data {
  String _appid;
  String _code;
  int _corpId;

  Data({String appid, String code, int corpId}) {
    this._appid = appid;
    this._code = code;
    this._corpId = corpId;
  }

  String get appid => _appid;

  set appid(String appid) => _appid = appid;

  String get code => _code;

  set code(String code) => _code = code;

  int get corpId => _corpId;

  set corpId(int corpId) => _corpId = corpId;

  Data.fromJson(Map<String, dynamic> json) {
    _appid = json['appid'];
    _code = json['code'];
    _corpId = json['corp_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appid'] = this._appid;
    data['code'] = this._code;
    data['corp_id'] = this._corpId;
    return data;
  }
}



class LoginBody {
  String appid;
  String code;
  int corpId;

  LoginBody(this.appid, this.code, this.corpId);

//  LoginBody.fromJson(Map<String, dynamic> json) {
//    appid = json['appid'];
//    code = json['code'];
//    corpId = json['corp_id'];
//  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appid'] = this.appid;
    data['code'] = this.code;
    data['corp_id'] = this.corpId;
    return data;
  }

  @override
  String toString() {
    return 'LoginBody{appid: $appid, code: $code, corpId: $corpId}';
  }


}


