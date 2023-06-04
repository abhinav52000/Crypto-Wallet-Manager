class GetMyBalanceModel {
  String? status;
  String? message;
  String? result;

  GetMyBalanceModel({this.status, this.message, this.result});

  GetMyBalanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'];
  }
}
