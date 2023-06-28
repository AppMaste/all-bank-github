class Banklist {
  List<Data>? data;

  Banklist({this.data});

  Banklist.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? bankName;
  String? balanceNumber;
  String? miniNumber;
  String? careNumber;
  String? balKey;
  String? balSmsNo;
  String? miniKey;
  String? miniSmsNo;

  Data(
      {this.id,
        this.bankName,
        this.balanceNumber,
        this.miniNumber,
        this.careNumber,
        this.balKey,
        this.balSmsNo,
        this.miniKey,
        this.miniSmsNo});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
    balanceNumber = json['balance_number'];
    miniNumber = json['mini_number'];
    careNumber = json['care_number'];
    balKey = json['bal_key'];
    balSmsNo = json['bal_sms_no'];
    miniKey = json['mini_key'];
    miniSmsNo = json['mini_sms_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_name'] = this.bankName;
    data['balance_number'] = this.balanceNumber;
    data['mini_number'] = this.miniNumber;
    data['care_number'] = this.careNumber;
    data['bal_key'] = this.balKey;
    data['bal_sms_no'] = this.balSmsNo;
    data['mini_key'] = this.miniKey;
    data['mini_sms_no'] = this.miniSmsNo;
    return data;
  }
}