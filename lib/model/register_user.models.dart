class RegisterUser {
  Location location;
  String id;
  String name;
  int age;
  String gender;
  String phoneNumber;
  String email;
  String fullAddress;

  RegisterUser({
    required this.location,
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.email,
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
