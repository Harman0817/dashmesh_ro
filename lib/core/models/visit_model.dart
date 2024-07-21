class VisitModel {
  String? customerId;
  String? visitDate;
  String? billingAmount;
  String? visitStatus;
  String? visitRemarks;
  String? serviceDuration;
  String? guaranteePeriod;
  String? serviceType;

  VisitModel(
      {this.customerId,
        this.visitDate,
        this.billingAmount,
        this.visitStatus,
        this.visitRemarks,
        this.serviceDuration,
        this.guaranteePeriod,
        this.serviceType});


  VisitModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    visitDate = json['visitDate'];
    billingAmount = json['billingAmount'];
    visitStatus = json['visitStatus'];
    visitRemarks = json['visitRemarks'];
    serviceDuration = json['serviceDuration'];
    guaranteePeriod = json['guaranteePeriod'];
    serviceType = json['serviceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['visitDate'] = visitDate;
    data['billingAmount'] = billingAmount;
    data['visitStatus'] = visitStatus;
    data['visitRemarks'] = visitRemarks;
    data['serviceDuration'] = serviceDuration;
    data['guaranteePeriod'] = guaranteePeriod;
    data['serviceType'] = serviceType;
    return data;
  }
}