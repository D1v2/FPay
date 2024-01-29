import 'Errors.dart';
import 'SearchResult.dart';
import 'Status.dart';

class HotelListResponse {
  HotelListResponse({
      this.searchResult, 
      this.status,
    this.errors,
  });

  HotelListResponse.fromJson(dynamic json) {
    searchResult = json['searchResult'] != null ? SearchResult.fromJson(json['searchResult']) : null;
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(Errors.fromJson(v));
      });
    }
  }
  SearchResult? searchResult;
  Status? status;
  List<Errors>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (searchResult != null) {
      map['searchResult'] = searchResult?.toJson();
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