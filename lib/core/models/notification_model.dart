class NotificationModel{
  int? customerId;
  int? visitId;
  String? visitDate;
  String? notificationDate;
  String? billingAmount;
  String? visitStatus;
  String? visitRemarks;
  String? serviceDuration;
  String? guaranteePeriod;
  String? serviceType;
  String? name;
  String? mobileNumber;
  String? address;
  String? locality;
  String? lastContactDate;
  String? purifierType;

  NotificationModel(
      {this.customerId,
      this.visitId,
      this.visitDate,
      this.notificationDate,
      this.billingAmount,
      this.visitStatus,
      this.visitRemarks,
      this.serviceDuration,
      this.guaranteePeriod,
      this.serviceType,
      this.name,
      this.mobileNumber,
      this.address,
      this.locality,
      this.lastContactDate,
      this.purifierType});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    visitId = json['visitId'];
    visitDate = json['visitDate'];
    notificationDate = json['notificationDate'];
    billingAmount = json['billingAmount'];
    visitStatus = json['visitStatus'];
    visitRemarks = json['visitRemarks'];
    serviceDuration = json['serviceDuration'];
    guaranteePeriod = json['guaranteePeriod'];
    serviceType = json['serviceType'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    address = json['address'];
    locality = json['locality'];
    lastContactDate = json['lastContactDate'];
    purifierType = json['purifierType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['visitId'] = visitId;
    data['visitDate'] = visitDate;
    data['notificationDate'] = notificationDate;
    data['billingAmount'] = billingAmount;
    data['visitStatus'] = visitStatus;
    data['visitRemarks'] = visitRemarks;
    data['serviceDuration'] = serviceDuration;
    data['guaranteePeriod'] = guaranteePeriod;
    data['serviceType'] = serviceType;
    data['name'] = name;
    data['mobileNumber'] = mobileNumber;
    data['address'] = address;
    data['locality'] = locality;
    data['lastContactDate'] = lastContactDate;
    data['purifierType'] = purifierType;
    return data;
  }
}