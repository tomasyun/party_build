import 'dart:convert' show json;

class MeetingSummary {
  String code;
  String msg;
  MeetingSummaryData data;

  MeetingSummary.fromParams({this.code, this.msg, this.data});

  factory MeetingSummary(jsonStr) => jsonStr == null
      ? null
      : jsonStr is String
          ? new MeetingSummary.fromJson(json.decode(jsonStr))
          : new MeetingSummary.fromJson(jsonStr);

  MeetingSummary.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null
        ? null
        : new MeetingSummaryData.fromJson(jsonRes['data']);
  }

  @override
  String toString() {
    return '{"code": ${code != null ? '${json.encode(code)}' : 'null'},"msg": ${msg != null ? '${json.encode(msg)}' : 'null'},"data": $data}';
  }
}

class MeetingSummaryData {
  String attachment;
  String attachmentName;
  String category;
  String endDate;
  String id;
  String speaker;
  String summary;
  String title;

  MeetingSummaryData.fromParams(
      {this.attachment,
      this.attachmentName,
      this.category,
      this.endDate,
      this.id,
      this.speaker,
      this.summary,
      this.title});

  MeetingSummaryData.fromJson(jsonRes) {
    attachment = jsonRes['attachment'];
    attachmentName = jsonRes['attachmentName'];
    category = jsonRes['category'];
    endDate = jsonRes['endDate'];
    id = jsonRes['id'];
    speaker = jsonRes['speaker'];
    summary = jsonRes['summary'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"attachment": ${attachment != null ? '${json.encode(attachment)}' : 'null'},"attachmentName": ${attachmentName != null ? '${json.encode(attachmentName)}' : 'null'},"category": ${category != null ? '${json.encode(category)}' : 'null'},"endDate": ${endDate != null ? '${json.encode(endDate)}' : 'null'},"id": ${id != null ? '${json.encode(id)}' : 'null'},"speaker": ${speaker != null ? '${json.encode(speaker)}' : 'null'},"summary": ${summary != null ? '${json.encode(summary)}' : 'null'},"title": ${title != null ? '${json.encode(title)}' : 'null'}}';
  }
}
