class Img {
  Img({
      this.url, 
      this.sz,});

  Img.fromJson(dynamic json) {
    url = json['url'];
    sz = json['sz'];
  }
  String? url;
  String? sz;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    map['sz'] = sz;
    return map;
  }

}