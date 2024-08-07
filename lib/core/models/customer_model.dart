import 'package:dashmesh_ro/core/shared/db_constants.dart';

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
    id = json[DbConstants.COL_ID];
    name = json[DbConstants.COL_NAME];
    mobileNumber = json[DbConstants.COL_MOBILE_NUMBER];
    address = json[DbConstants.COL_ADDRESS];
    locality = json[DbConstants.COL_LOCALITY];
    lastContactDate = json[DbConstants.COL_LAST_CONTACT_DATE];
    purifierType = json[DbConstants.COL_PURIFIER_TYPE];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[DbConstants.COL_ID] = id;
    data[DbConstants.COL_NAME] = name;
    data[DbConstants.COL_MOBILE_NUMBER] = mobileNumber;
    data[DbConstants.COL_ADDRESS] = address;
    data[DbConstants.COL_LOCALITY] = locality;
    data[DbConstants.COL_LAST_CONTACT_DATE] = lastContactDate;
    data[DbConstants.COL_PURIFIER_TYPE] = purifierType;
    return data;
    }
}