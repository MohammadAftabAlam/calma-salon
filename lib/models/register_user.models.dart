class RegisterUserModel {
  Location location;
  String id;
  String name;
  int age;
  String gender;
  String phoneNumber;
  String email;
  String fullAddress;

  RegisterUserModel({
    required this.location,
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.email,
    required this.fullAddress
  });

  // Converting user data to json format
 Map<String, dynamic> toJson() {
      return {
        'location': location.toJson(),
        '_id': id,
        'name': name,
        'age': age,
        'gender': gender,
        'phoneNumber': phoneNumber,
        'email': email,
        'fullAddress': fullAddress,
      };
    }

}

class Location {
  String type;
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  // Converting location to json format
  Map<String, dynamic> toJson(){
    return {
      "type": "Point",
      "coordinates": coordinates
    };
  }

}
