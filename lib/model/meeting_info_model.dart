import 'dart:convert' show json;

class MeetingInfo {
  String code;
  String msg;
  MeetingInfoData data;

  MeetingInfo.fromParams({this.code, this.msg, this.data});

  factory MeetingInfo(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new MeetingInfo.fromJson(json.decode(jsonStr))
          : new MeetingInfo.fromJson(jsonStr);

  MeetingInfo.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new MeetingInfoData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class MeetingInfoData {
  String action;
  String address;
  String attendNum;
  String brief;
  String category;
  String conferenceState;
  String id;
  String leaveState;
  String signUpState;
  String speaker;
  String startDate;
  String theme;
  String themeImg;
  List<String> attender;

  MeetingInfoData.fromParams(
      {this.action,
      this.address,
      this.attendNum,
      this.brief,
      this.category,
      this.conferenceState,
      this.id,
      this.leaveState,
      this.signUpState,
      this.speaker,
      this.startDate,
      this.theme,
      this.themeImg,
      this.attender});

  MeetingInfoData.fromJson(jsonRes) {
    action = jsonRes['action'];
    address = jsonRes['address'];
    attendNum = jsonRes['attendNum'];
    brief = jsonRes['brief'];
    category = jsonRes['category'];
    conferenceState = jsonRes['conferenceState'];
    id = jsonRes['id'];
    leaveState = jsonRes['leaveState'];
    signUpState = jsonRes['signUpState'];
    speaker = jsonRes['speaker'];
    startDate = jsonRes['startDate'];
    theme = jsonRes['theme'];
    themeImg = jsonRes['themeImg'];
    attender = jsonRes['attender'] == null ? null : [];

    for (var attenderItem in attender == null ? [] : jsonRes['attender']) {
      attender.add(attenderItem);
    }
  }

  @override
  String toString() {
    return '{"action": ${action != null ? '${json.encode(action)}' : 'null'},"address": ${address != null ? '${json.encode(address)}' : 'null'},"attendNum": ${attendNum != null ? '${json.encode(attendNum)}' : 'null'},"brief": ${brief != null ? '${json.encode(brief)}' : 'null'},"category": ${category != null ? '${json.encode(category)}' : 'null'},"conferenceState": ${conferenceState != null ? '${json.encode(conferenceState)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"leaveState": ${leaveState != null ? '${json.encode(leaveState)}' : 'null'},"signUpState": ${signUpState != null ? '${json.encode(signUpState)}' : 'null'},"speaker": ${speaker != null ? '${json.encode(speaker)}' : 'null'},"startDate": ${startDate != null ? '${json.encode(startDate)}' : 'null'},"theme": ${theme != null ? '${json.encode(theme)}' : 'null'},"themeImg": ${themeImg != null ? '${json.encode(themeImg)}' : 'null'},"attender": $attender}';
  }
}
