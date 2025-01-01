class MyBookingServicesModel {
  const MyBookingServicesModel({
    required this.salonName,
    required this.salonLocation,
    required this.salonImage,
    required this.date,
    required this.time,
  });

  final String salonName;
  final String salonLocation;
  final String date;
  final String time;
  final String salonImage;
}
