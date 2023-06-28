class BankHolidaylist {
  List<BankHoliDay>? bankHoliDay;

  BankHolidaylist({this.bankHoliDay});

  BankHolidaylist.fromJson(Map<String, dynamic> json) {
    if (json['BankHoliDay'] != null) {
      bankHoliDay = <BankHoliDay>[];
      json['BankHoliDay'].forEach((v) {
        bankHoliDay!.add(new BankHoliDay.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bankHoliDay != null) {
      data['BankHoliDay'] = this.bankHoliDay!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BankHoliDay {
  String? shortDate;
  String? fulltDate;
  String? month;
  String? year;
  String? day;
  String? holiDayName;

  BankHoliDay(
      {this.shortDate,
        this.fulltDate,
        this.month,
        this.year,
        this.day,
        this.holiDayName});

  BankHoliDay.fromJson(Map<String, dynamic> json) {
    shortDate = json['ShortDate'];
    fulltDate = json['FulltDate'];
    month = json['Month'];
    year = json['Year'];
    day = json['Day'];
    holiDayName = json['HoliDayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ShortDate'] = this.shortDate;
    data['FulltDate'] = this.fulltDate;
    data['Month'] = this.month;
    data['Year'] = this.year;
    data['Day'] = this.day;
    data['HoliDayName'] = this.holiDayName;
    return data;
  }
}