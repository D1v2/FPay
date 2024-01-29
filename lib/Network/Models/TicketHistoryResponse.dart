class TicketHistoryResponse {
  bool? status;
  int? code;
  String? message;
  List<TicketHistoryData>? data;

  TicketHistoryResponse({this.status, this.code, this.message, this.data});

  TicketHistoryResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TicketHistoryData>[];
      json['data'].forEach((v) {
        data!.add(TicketHistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TicketHistoryData {
  String? memberID;
  String? memberName;
  String? mobile;
  int? priorityID;
  int? departmentID;
  String? subject;
  String? message;
  Null? solution;
  String? status;
  String? priorityName;
  String? departmentName;
  String? addDate;
  Null? solvedDate;

  TicketHistoryData(
      {this.memberID,
      this.memberName,
      this.mobile,
      this.priorityID,
      this.departmentID,
      this.subject,
      this.message,
      this.solution,
      this.status,
      this.priorityName,
      this.departmentName,
      this.addDate,
      this.solvedDate});

  TicketHistoryData.fromJson(Map<String, dynamic> json) {
    memberID = json['MemberID'];
    memberName = json['MemberName'];
    mobile = json['Mobile'];
    priorityID = json['PriorityID'];
    departmentID = json['DepartmentID'];
    subject = json['Subject'];
    message = json['Message'];
    solution = json['Solution'];
    status = json['Status'];
    priorityName = json['PriorityName'];
    departmentName = json['DepartmentName'];
    addDate = json['AddDate'];
    solvedDate = json['SolvedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MemberID'] = memberID;
    data['MemberName'] = memberName;
    data['Mobile'] = mobile;
    data['PriorityID'] = priorityID;
    data['DepartmentID'] = departmentID;
    data['Subject'] = subject;
    data['Message'] = message;
    data['Solution'] = solution;
    data['Status'] = status;
    data['PriorityName'] = priorityName;
    data['DepartmentName'] = departmentName;
    data['AddDate'] = addDate;
    data['SolvedDate'] = solvedDate;
    return data;
  }
}