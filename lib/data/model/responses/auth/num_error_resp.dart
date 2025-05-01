

class  ErrorPhone{
  ErrorPhone({
      this.value, 
      this.msg, 
      this.param, 
      this.location,});

  ErrorPhone.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }
  String? value;
  String? msg;
  String? param;
  String? location;



}