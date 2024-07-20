class ServiceItem {
  String name;
  String mobile;
  String address;
  String locality;
  String lastContactDate;
  String purifierType;
  bool isCompleted;

  ServiceItem(
      {required this.name,
      required this.mobile,
      required this.address,
      required this.lastContactDate,
      required this.locality,
      required this.purifierType,
      required this.isCompleted});
}
