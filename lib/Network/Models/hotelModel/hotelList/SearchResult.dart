import 'His.dart';

class SearchResult {
  SearchResult({
      this.his, 
      this.size,});

  SearchResult.fromJson(dynamic json) {
    if (json['his'] != null) {
      his = [];
      json['his'].forEach((v) {
        his?.add(His.fromJson(v));
      });
    }
    size = json['size'];
  }
  List<His>? his;
  int? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (his != null) {
      map['his'] = his?.map((v) => v.toJson()).toList();
    }
    map['size'] = size;
    return map;
  }

}