class Country {
  Country({
      this.code, 
      this.name,});

  Country.fromJson(dynamic json) {
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