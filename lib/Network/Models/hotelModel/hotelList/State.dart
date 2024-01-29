class State {
  State({
      this.code, 
      this.name,});

  State.fromJson(dynamic json) {
    code = json['code'];
    name = json['name'];
  }
  String? code;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['name'] = name;
    return map;
  }

}