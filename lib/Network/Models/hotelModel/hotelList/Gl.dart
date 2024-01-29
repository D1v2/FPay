class Gl {
  Gl({
      this.ln, 
      this.lt,});

  Gl.fromJson(dynamic json) {
    ln = json['ln'];
    lt = json['lt'];
  }
  String? ln;
  String? lt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ln'] = ln;
    map['lt'] = lt;
    return map;
  }

}