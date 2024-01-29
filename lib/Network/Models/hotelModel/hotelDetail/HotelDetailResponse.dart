import '../hotelList/Errors.dart';
import 'Hotel.dart';
import 'SearchQuery.dart';
import 'Status.dart';

class HotelDetailResponse {
  HotelDetailResponse({
    this.id,
    this.hotel,
    this.searchQuery,
    this.status,
    this.errors,
  });

  HotelDetailResponse.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    id = json['id'];
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
    searchQuery = json['searchQuery'] != null
        ? SearchQuery.fromJson(json['searchQuery'])
        : null;
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(Errors.fromJson(v));
      });
    }
  }

  Status? status;
  List<Errors>? errors;
  String? id;
  Hotel? hotel;
  SearchQuery? searchQuery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (hotel != null) {
      map['hotel'] = hotel?.toJson();
    }
    if (searchQuery != null) {
      map['searchQuery'] = searchQuery?.toJson();
    }
    if (status != null) {
      map['status'] = status?.toJson();
    }
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
