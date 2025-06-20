class GetNearbySalon {
  Data data;

  GetNearbySalon({
    required this.data,
  });

}

class Data {
  List<NearbySalon> nearbySalon;
  List<NearbySalonExpert> nearbySalonExpert;
  Map<String, List<GetNearbySalonService>> getNearbySalonServices;

  Data({
    required this.nearbySalon,
    required this.nearbySalonExpert,
    required this.getNearbySalonServices,
  });

}

class GetNearbySalonService {
  String id;
  String name;
  int price;
  int duration;
  bool isActive;
  Category category;

  GetNearbySalonService({
    required this.id,
    required this.name,
    required this.price,
    required this.duration,
    required this.isActive,
    required this.category,
  });

}

class NearbySalon {
  Location location;
  String id;
  String salonName;
  String phoneNumber;
  String email;
  String salonImage;
  String description;
  String yearOfExperience;
  DateTime openingTime;
  DateTime closingTime;
  String fullAddress;

  NearbySalon({
    required this.location,
    required this.id,
    required this.salonName,
    required this.phoneNumber,
    required this.email,
    required this.salonImage,
    required this.description,
    required this.yearOfExperience,
    required this.openingTime,
    required this.closingTime,
    required this.fullAddress
  });

}

class Location {
  String type;
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

}

class NearbySalonExpert {
  String id;
  String salonId;
  String fullName;
  String avatar;
  List<String> services;
  int experience;

  NearbySalonExpert({
    required this.id,
    required this.salonId,
    required this.fullName,
    required this.avatar,
    required this.services,
    required this.experience,
  });
}

enum Category{
  men,
  women
}