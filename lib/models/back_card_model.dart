class BackCardModel {
  String? backNumber;
  int? backNumberStatus;
  double? detectionScore;
  String? errorMessage;
  double? processTime;
  String? requestId;

  BackCardModel(
      {this.backNumber,
      this.backNumberStatus,
      this.detectionScore,
      this.errorMessage,
      this.processTime,
      this.requestId});

  BackCardModel.fromJson(Map<String, dynamic> json) {
    backNumber = json['back_number'];
    backNumberStatus = json['back_number_status'];
    detectionScore = json['detection_score'];
    errorMessage = json['error_message'];
    processTime = json['process_time'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_number'] = backNumber;
    data['back_number_status'] = backNumberStatus;
    data['detection_score'] = detectionScore;
    data['error_message'] = errorMessage;
    data['process_time'] = processTime;
    data['request_id'] = requestId;
    return data;
  }
}
