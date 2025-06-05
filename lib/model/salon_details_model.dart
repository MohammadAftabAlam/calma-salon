import 'package:calma/Model/salon_expert.dart';

class SalonDetails {
  const SalonDetails({
    required this.id,
    required this.salonName,
    required this.salonImagePath,
    required this.salonLocation,
    required this.distance,
    required this.review,
    required this.genderType,
    required this.rating,
    required this.fullAddress,
    required this.isSeatVacant,
    required this.salonExperts,
  });
  final String id;
  final String salonName;
  final String salonImagePath;
  final String salonLocation;
  final String genderType;
  final String fullAddress;
  final String rating;
  final double distance;
  final int review;
  final bool isSeatVacant;
  final List<SalonExperts> salonExperts;
  // final List<String> details;
}
