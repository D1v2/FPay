class ProfileData {
  ProfileData({
      this.id, 
      this.msrNo, 
      this.memberTypeID, 
      this.memberID, 
      this.titleID, 
      this.firstName, 
      this.middleName, 
      this.lastName, 
      this.mobile, 
      this.email, 
      this.loginID, 
      this.password, 
      this.tPassword, 
      this.dob, 
      this.gender, 
      this.sTDCode, 
      this.ladline, 
      this.localAddress, 
      this.parmanentAddress, 
      this.landmark, 
      this.countryID, 
      this.stateID, 
      this.cityID, 
      this.zip, 
      this.careOf, 
      this.careOfName, 
      this.doj, 
      this.doa, 
      this.firmName, 
      this.partnerName, 
      this.partnerMobile, 
      this.isEmailSubscribe, 
      this.isSMSSubscribe, 
      this.isEmailVerify, 
      this.isMobileVerify, 
      this.deviceSerialNo, 
      this.memberImage, 
      this.sources, 
      this.iPAddress, 
      this.mACAddress, 
      this.lastLoginDate, 
      this.lastLoginIP, 
      this.isBlock, 
      this.isUpdate, 
      this.addDate, 
      this.lastUpdate, 
      this.fromDate, 
      this.toDate, 
      this.memberType, 
      this.memberBalance, 
      this.newPassword, 
      this.confirmPassword, 
      this.aadharNumber, 
      this.panNumber, 
      this.panPhoto, 
      this.aadharPhoto, 
      this.name, 
      this.countryName, 
      this.stateName, 
      this.cityName,});

  ProfileData.fromJson(dynamic json) {
    id = json['Id'];
    msrNo = json['MsrNo'];
    memberTypeID = json['MemberTypeID'];
    memberID = json['MemberID'];
    titleID = json['TitleID'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    mobile = json['Mobile'];
    email = json['Email'];
    loginID = json['LoginID'];
    password = json['Password'];
    tPassword = json['TPassword'];
    dob = json['DOB'];
    gender = json['Gender'];
    sTDCode = json['STDCode'];
    ladline = json['Ladline'];
    localAddress = json['LocalAddress'];
    parmanentAddress = json['ParmanentAddress'];
    landmark = json['Landmark'];
    countryID = json['CountryID'];
    stateID = json['StateID'];
    cityID = json['CityID'];
    zip = json['ZIP'];
    careOf = json['CareOf'];
    careOfName = json['CareOfName'];
    doj = json['DOJ'];
    doa = json['DOA'];
    firmName = json['FirmName'];
    partnerName = json['PartnerName'];
    partnerMobile = json['PartnerMobile'];
    isEmailSubscribe = json['IsEmailSubscribe'];
    isSMSSubscribe = json['IsSMSSubscribe'];
    isEmailVerify = json['IsEmailVerify'];
    isMobileVerify = json['IsMobileVerify'];
    deviceSerialNo = json['DeviceSerialNo'];
    memberImage = json['MemberImage'];
    sources = json['Sources'];
    iPAddress = json['IPAddress'];
    mACAddress = json['MACAddress'];
    lastLoginDate = json['LastLoginDate'];
    lastLoginIP = json['LastLoginIP'];
    isBlock = json['IsBlock'];
    isUpdate = json['IsUpdate'];
    addDate = json['AddDate'];
    lastUpdate = json['LastUpdate'];
    fromDate = json['FromDate'];
    toDate = json['ToDate'];
    memberType = json['MemberType'];
    memberBalance = json['MemberBalance'];
    newPassword = json['NewPassword'];
    confirmPassword = json['ConfirmPassword'];
    aadharNumber = json['AadharNumber'];
    panNumber = json['PanNumber'];
    panPhoto = json['PanPhoto'];
    aadharPhoto = json['AadharPhoto'];
    name = json['Name'];
    countryName = json['CountryName'];
    stateName = json['StateName'];
    cityName = json['CityName'];
  }
  int? id;
  int? msrNo;
  int? memberTypeID;
  String? memberID;
  dynamic? titleID;
  String? firstName;
  dynamic? middleName;
  String? lastName;
  String? mobile;
  String? email;
  String? loginID;
  String? password;
  String? tPassword;
  dynamic? dob;
  dynamic? gender;
  dynamic? sTDCode;
  dynamic? ladline;
  dynamic? localAddress;
  String? parmanentAddress;
  dynamic? landmark;
  int? countryID;
  int? stateID;
  int? cityID;
  String? zip;
  dynamic? careOf;
  dynamic? careOfName;
  dynamic? doj;
  dynamic? doa;
  String? firmName;
  dynamic? partnerName;
  dynamic? partnerMobile;
  int? isEmailSubscribe;
  int? isSMSSubscribe;
  int? isEmailVerify;
  int? isMobileVerify;
  dynamic? deviceSerialNo;
  dynamic? memberImage;
  String? sources;
  dynamic? iPAddress;
  dynamic? mACAddress;
  String? lastLoginDate;
  String? lastLoginIP;
  bool? isBlock;
  bool? isUpdate;
  String? addDate;
  String? lastUpdate;
  dynamic? fromDate;
  dynamic? toDate;
  String? memberType;
  String? memberBalance;
  dynamic? newPassword;
  dynamic? confirmPassword;
  dynamic? aadharNumber;
  dynamic? panNumber;
  dynamic? panPhoto;
  dynamic? aadharPhoto;
  String? name;
  String? countryName;
  String? stateName;
  String? cityName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['MsrNo'] = msrNo;
    map['MemberTypeID'] = memberTypeID;
    map['MemberID'] = memberID;
    map['TitleID'] = titleID;
    map['FirstName'] = firstName;
    map['MiddleName'] = middleName;
    map['LastName'] = lastName;
    map['Mobile'] = mobile;
    map['Email'] = email;
    map['LoginID'] = loginID;
    map['Password'] = password;
    map['TPassword'] = tPassword;
    map['DOB'] = dob;
    map['Gender'] = gender;
    map['STDCode'] = sTDCode;
    map['Ladline'] = ladline;
    map['LocalAddress'] = localAddress;
    map['ParmanentAddress'] = parmanentAddress;
    map['Landmark'] = landmark;
    map['CountryID'] = countryID;
    map['StateID'] = stateID;
    map['CityID'] = cityID;
    map['ZIP'] = zip;
    map['CareOf'] = careOf;
    map['CareOfName'] = careOfName;
    map['DOJ'] = doj;
    map['DOA'] = doa;
    map['FirmName'] = firmName;
    map['PartnerName'] = partnerName;
    map['PartnerMobile'] = partnerMobile;
    map['IsEmailSubscribe'] = isEmailSubscribe;
    map['IsSMSSubscribe'] = isSMSSubscribe;
    map['IsEmailVerify'] = isEmailVerify;
    map['IsMobileVerify'] = isMobileVerify;
    map['DeviceSerialNo'] = deviceSerialNo;
    map['MemberImage'] = memberImage;
    map['Sources'] = sources;
    map['IPAddress'] = iPAddress;
    map['MACAddress'] = mACAddress;
    map['LastLoginDate'] = lastLoginDate;
    map['LastLoginIP'] = lastLoginIP;
    map['IsBlock'] = isBlock;
    map['IsUpdate'] = isUpdate;
    map['AddDate'] = addDate;
    map['LastUpdate'] = lastUpdate;
    map['FromDate'] = fromDate;
    map['ToDate'] = toDate;
    map['MemberType'] = memberType;
    map['MemberBalance'] = memberBalance;
    map['NewPassword'] = newPassword;
    map['ConfirmPassword'] = confirmPassword;
    map['AadharNumber'] = aadharNumber;
    map['PanNumber'] = panNumber;
    map['PanPhoto'] = panPhoto;
    map['AadharPhoto'] = aadharPhoto;
    map['Name'] = name;
    map['CountryName'] = countryName;
    map['StateName'] = stateName;
    map['CityName'] = cityName;
    return map;
  }

}