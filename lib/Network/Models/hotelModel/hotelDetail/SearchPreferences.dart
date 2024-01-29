class SearchPreferences {
  SearchPreferences({
      this.ratings, 
      this.currency, 
      this.fsc,});

  SearchPreferences.fromJson(dynamic json) {
    ratings = json['ratings'] != null ? json['ratings'].cast<int>() : [];
    currency = json['currency'];
    fsc = json['fsc'];
  }
  List<int>? ratings;
  String? currency;
  bool? fsc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ratings'] = ratings;
    map['currency'] = currency;
    map['fsc'] = fsc;
    return map;
  }

}