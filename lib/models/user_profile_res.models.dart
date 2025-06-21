class User {
  int statusCode;
  Data data;
  String message;
  bool success;

  User({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      statusCode: json['statusCode'],
      data: Data.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
    );
  }
}

class Data {
  Location location;
  String id;
  String name;
  int age;
  String gender;
  String phoneNumber;
  String email;
  String avatarImage;
  bool isDefaultAvatarImage;
  DateTime createdAt;
  DateTime updatedAt;
  String fullAddress;
  int v;

  Data({
    required this.location,
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.avatarImage,
    required this.isDefaultAvatarImage,
    required this.createdAt,
    required this.updatedAt,
    required this.fullAddress,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      location: Location.fromJson(json['location']),
      id: json['_id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      avatarImage: json['avatarImage'],
      isDefaultAvatarImage: json['isDefaultAvatarImage'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      fullAddress: json['fullAddress'],
      v: json['__v'],
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
