import 'RoomInfo.dart';
import 'SearchCriteria.dart';
import 'SearchPreferences.dart';

class SearchQuery {
  SearchQuery({
      this.checkinDate, 
      this.checkoutDate, 
      this.roomInfo, 
      this.searchCriteria, 
      this.searchPreferences, 
      this.searchId, 
      this.isSearchCompleted, 
      this.miscInfo,});

  SearchQuery.fromJson(dynamic json) {
    checkinDate = json['checkinDate'];
    checkoutDate = json['checkoutDate'];
    if (json['roomInfo'] != null) {
      roomInfo = [];
      json['roomInfo'].forEach((v) {
        roomInfo?.add(RoomInfo.fromJson(v));
      });
    }
    searchCriteria = json['searchCriteria'] != null ? SearchCriteria.fromJson(json['searchCriteria']) : null;
    searchPreferences = json['searchPreferences'] != null ? SearchPreferences.fromJson(json['searchPreferences']) : null;
    searchId = json['searchId'];
    isSearchCompleted = json['isSearchCompleted'];
    miscInfo = json['miscInfo'];
  }
  String? checkinDate;
  String? checkoutDate;
  List<RoomInfo>? roomInfo;
  SearchCriteria? searchCriteria;
  SearchPreferences? searchPreferences;
  String? searchId;
  bool? isSearchCompleted;
  dynamic miscInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['checkinDate'] = checkinDate;
    map['checkoutDate'] = checkoutDate;
    if (roomInfo != null) {
      map['roomInfo'] = roomInfo?.map((v) => v.toJson()).toList();
    }
    if (searchCriteria != null) {
      map['searchCriteria'] = searchCriteria?.toJson();
    }
    if (searchPreferences != null) {
      map['searchPreferences'] = searchPreferences?.toJson();
    }
    map['searchId'] = searchId;
    map['isSearchCompleted'] = isSearchCompleted;
    map['miscInfo'] = miscInfo;
    return map;
  }

}