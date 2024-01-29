class Inst {
  Inst({
      this.type, 
      this.msg,});

  Inst.fromJson(dynamic json) {
    type = json['type'];
    msg = json['msg'];
  }
  String? type;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['msg'] = msg;
    return map;
  }

}