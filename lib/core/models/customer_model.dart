class CustomerModel{
  int? id;
  String? name;
  String? mobileNumber;
  String? address;
  String? locality;
  String? lastContactDate;
  String? purifierType;

  CustomerModel(
      {
        this.id,
        this.name,
        this.mobileNumber,
        this.address,
        this.locality,
        this.lastContactDate,
        this.purifierType});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    address = json['address'];
    locality = json['locality'];
    lastContactDate = json['lastContactDate'];
    purifierType = json['purifierType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobileNumber'] = mobileNumber;
    data['address'] = address;
    data['locality'] = locality;
    data['lastContactDate'] = lastContactDate;
    data['purifierType'] = purifierType;
    return data;
    }
}