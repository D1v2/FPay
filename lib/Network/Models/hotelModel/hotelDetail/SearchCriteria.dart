class SearchCriteria {
  SearchCriteria({
      this.city, 
      this.countryName, 
      this.cityName, 
      this.nationality,});

  SearchCriteria.fromJson(dynamic json) {
    city = json['city'];
    countryName = json['countryName'];
    cityName = json['cityName'];
    nationality = json['nationality'];
  }
  String? city;
  String? countryName;
  String? cityName;
  String? nationality;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['countryName'] = countryName;
    map['cityName'] = cityName;
    map['nationality'] = nationality;
    return map;
  }

}