import 'package:dashmesh_ro/core/shared/db_constants.dart';

class VisitModel {
  int? id;
  int? customerId;
  String? visitDate;
  String? billingAmount;
  String? visitStatus;
  String? visitRemarks;
  String? serviceDuration;
  String? guaranteePeriod;
  String? serviceType;

  VisitModel(
      {this.id,
        this.customerId,
        this.visitDate,
        this.billingAmount,
        this.visitStatus,
        this.visitRemarks,
        this.serviceDuration,
        this.guaranteePeriod,
        this.serviceType});


  VisitModel.fromJson(Map<String, dynamic> json) {
    id = json[DbConstants.COL_ID];
    customerId = json[DbConstants.COL_CUSTOMER_ID];
    visitDate = json[DbConstants.COL_VISIT_DATE];
    billingAmount = json[DbConstants.COL_BILLING_AMOUNT];
    visitStatus = json[DbConstants.COL_VISIT_STATUS];
    visitRemarks = json[DbConstants.COL_VISIT_REMARKS];
    serviceDuration = json[DbConstants.COL_SERVICE_DURATION];
    guaranteePeriod = json[DbConstants.COL_GUARANTEE_PERIOD];
    serviceType = json[DbConstants.COL_SERVICE_TYPE];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[DbConstants.COL_ID] = id;
    data[DbConstants.COL_CUSTOMER_ID] = customerId;
    data[DbConstants.COL_VISIT_DATE] = visitDate;
    data[DbConstants.COL_BILLING_AMOUNT] = billingAmount;
    data[DbConstants.COL_VISIT_STATUS] = visitStatus;
    data[DbConstants.COL_VISIT_REMARKS] = visitRemarks;
    data[DbConstants.COL_SERVICE_DURATION] = serviceDuration;
    data[DbConstants.COL_GUARANTEE_PERIOD] = guaranteePeriod;
    data[DbConstants.COL_SERVICE_TYPE] = serviceType;
    return data;
  }
}