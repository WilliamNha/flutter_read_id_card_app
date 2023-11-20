class FrontCardModel {
  String? address;
  String? alley;
  double? detectionScore;
  String? district;
  String? enDob;
  String? enExpire;
  String? enFname;
  String? enInit;
  String? enIssue;
  String? enLname;
  String? enName;
  String? errorMessage;
  String? face;
  String? gender;
  String? homeAddress;
  String? houseNo;
  String? idNumber;
  int? idNumberStatus;
  String? lane;
  String? postalCode;
  double? processTime;
  String? province;
  String? religion;
  String? requestId;
  String? road;
  String? subDistrict;
  String? thDob;
  String? thExpire;
  String? thFname;
  String? thInit;
  String? thIssue;
  String? thLname;
  String? thName;
  String? village;
  String? villageNo;

  FrontCardModel(
      {this.address,
      this.alley,
      this.detectionScore,
      this.district,
      this.enDob,
      this.enExpire,
      this.enFname,
      this.enInit,
      this.enIssue,
      this.enLname,
      this.enName,
      this.errorMessage,
      this.face,
      this.gender,
      this.homeAddress,
      this.houseNo,
      this.idNumber,
      this.idNumberStatus,
      this.lane,
      this.postalCode,
      this.processTime,
      this.province,
      this.religion,
      this.requestId,
      this.road,
      this.subDistrict,
      this.thDob,
      this.thExpire,
      this.thFname,
      this.thInit,
      this.thIssue,
      this.thLname,
      this.thName,
      this.village,
      this.villageNo});

  FrontCardModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    alley = json['alley'];
    detectionScore = json['detection_score'];
    district = json['district'];
    enDob = json['en_dob'];
    enExpire = json['en_expire'];
    enFname = json['en_fname'];
    enInit = json['en_init'];
    enIssue = json['en_issue'];
    enLname = json['en_lname'];
    enName = json['en_name'];
    errorMessage = json['error_message'];
    face = json['face'];
    gender = json['gender'];
    homeAddress = json['home_address'];
    houseNo = json['house_no'];
    idNumber = json['id_number'];
    idNumberStatus = json['id_number_status'];
    lane = json['lane'];
    postalCode = json['postal_code'];
    processTime = json['process_time'];
    province = json['province'];
    religion = json['religion'];
    requestId = json['request_id'];
    road = json['road'];
    subDistrict = json['sub_district'];
    thDob = json['th_dob'];
    thExpire = json['th_expire'];
    thFname = json['th_fname'];
    thInit = json['th_init'];
    thIssue = json['th_issue'];
    thLname = json['th_lname'];
    thName = json['th_name'];
    village = json['village'];
    villageNo = json['village_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['alley'] = alley;
    data['detection_score'] = detectionScore;
    data['district'] = district;
    data['en_dob'] = enDob;
    data['en_expire'] = enExpire;
    data['en_fname'] = enFname;
    data['en_init'] = enInit;
    data['en_issue'] = enIssue;
    data['en_lname'] = enLname;
    data['en_name'] = enName;
    data['error_message'] = errorMessage;
    data['face'] = face;
    data['gender'] = gender;
    data['home_address'] = homeAddress;
    data['house_no'] = houseNo;
    data['id_number'] = idNumber;
    data['id_number_status'] = idNumberStatus;
    data['lane'] = lane;
    data['postal_code'] = postalCode;
    data['process_time'] = processTime;
    data['province'] = province;
    data['religion'] = religion;
    data['request_id'] = requestId;
    data['road'] = road;
    data['sub_district'] = subDistrict;
    data['th_dob'] = thDob;
    data['th_expire'] = thExpire;
    data['th_fname'] = thFname;
    data['th_init'] = thInit;
    data['th_issue'] = thIssue;
    data['th_lname'] = thLname;
    data['th_name'] = thName;
    data['village'] = village;
    data['village_no'] = villageNo;
    return data;
  }
}
