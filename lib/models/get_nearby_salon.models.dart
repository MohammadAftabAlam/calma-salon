class GetNearbySalon {
  Data data;

  GetNearbySalon({
    required this.data,
  });

  factory GetNearbySalon.fromJson(Map<String, dynamic> json) {
    return GetNearbySalon(
      data: Data.fromJson(json['data']),
    );
  }
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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      nearbySalon: List<NearbySalon>.from(
        json['nearbySalon'].map((e) => NearbySalon.fromJson(e)),
      ),
      nearbySalonExpert: List<NearbySalonExpert>.from(
        json['nearbySalonExpert'].map((e) => NearbySalonExpert.fromJson(e)),
      ),
      getNearbySalonServices: Map<String, List<GetNearbySalonService>>.from(
        json['getNearbySalonServices'].map((key, value) {
          return MapEntry(
            key,
            List<GetNearbySalonService>.from(
              value.map((e) => GetNearbySalonService.fromJson(e)),
            ),
          );
        }),
      ),
    );
  }
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

  factory GetNearbySalonService.fromJson(Map<String, dynamic> json) {
    return GetNearbySalonService(
      id: json['_id'],
      name: json['name'],
      price: json['price'],
      duration: json['duration'],
      isActive: json['isActive'],
      category: categoryFromString(json['category']),
    );
  }
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
    required this.fullAddress,
  });

  factory NearbySalon.fromJson(Map<String, dynamic> json) {
    return NearbySalon(
      location: Location.fromJson(json['location']),
      id: json['_id'],
      salonName: json['salonName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      salonImage: json['salonImage'],
      description: json['description'],
      yearOfExperience: json['yearOfExperience'],
      openingTime: DateTime.parse(json['openingTime']),
      closingTime: DateTime.parse(json['closingTime']),
      fullAddress: json['fullAddress'],
    );
  }
}

class Location {
  String type;
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json['type'],
      coordinates:
      List<double>.from(json['coordinates'].map((e) => e.toDouble())),
    );
  }
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

  factory NearbySalonExpert.fromJson(Map<String, dynamic> json) {
    return NearbySalonExpert(
      id: json['_id'],
      salonId: json['salonId'],
      fullName: json['fullName'],
      avatar: json['avatar'],
      services: List<String>.from(json['services']),
      experience: json['experience'],
    );
  }
}

enum Category {
  men,
  women,
}

// Helper function to convert String to Enum
Category categoryFromString(String value) {
  switch (value.toLowerCase()) {
    case 'men':
      return Category.men;
    case 'women':
      return Category.women;
    default:
      throw Exception('Unknown category: $value');
  }
}
