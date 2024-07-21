class DbConstants{
  /*db name*/
  static const String DATA_BASE = "ro.db";

  /*................................Table Name......................*/
  static const String TABLE_VISIT_LIST = "VisitList";
  static const String TABLE_CUSTOMER_LIST = "CustomerList";

  /*................................VisitList TABLE KEY......................*/
  static const String COL_ID= "Id";
  static const String COL_CUSTOMER_ID= "customerId";
  static const String COL_VISIT_DATE= "visitDate";
  static const String COL_BILLING_AMOUNT= "billingAmount";
  static const String COL_VISIT_STATUS= "visitStatus";
  static const String COL_VISIT_REMARKS= "visitRemarks";
  static const String COL_SERVICE_DURATION= "serviceDuration";
  static const String COL_GUARANTEE_PERIOD= "guaranteePeriod";
  static const String COL_SERVICE_TYPE= "serviceType";

  /*................................CustomerList TABLE KEY......................*/
  static const String COL_NAME= "name";
  static const String COL_MOBILE_NUMBER= "mobileNumber";
  static const String COL_ADDRESS= "address";
  static const String COL_LOCALITY= "locality";
  static const String COL_LAST_CONTACT_DATE= "lastContactDate";
  static const String COL_PURIFIER_TYPE="purifierType";
}