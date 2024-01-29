class Benefit {
  Benefit({
      this.values,});

  Benefit.fromJson(dynamic json) {
    values = json['values'] != null ? json['values'].cast<String>() : [];
  }
  List<String>? values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['values'] = values;
    return map;
  }

}