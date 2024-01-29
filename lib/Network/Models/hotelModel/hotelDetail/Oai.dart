class Oai {
  Oai({
      this.sid,});

  Oai.fromJson(dynamic json) {
    sid = json['sid'];
  }
  String? sid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sid'] = sid;
    return map;
  }

}