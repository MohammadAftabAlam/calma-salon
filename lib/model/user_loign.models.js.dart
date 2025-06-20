class UserLogin {
  int statusCode;
  Data data;
  String message;
  bool success;

  UserLogin({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      statusCode: json['statusCode'],
      data: Data.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
    );
  }
}

class Data {
  User user;
  String refreshToken;
  String accessToken;

  Data({
    required this.user,
    required this.refreshToken,
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user']),
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
    );
  }
}

class User {
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
  int v;

  User({
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
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
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
      coordinates: List<double>.from(json['coordinates'].map((e) => e.toDouble())),
    );
  }
}
