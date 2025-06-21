class StaticServices {
  int statusCode;
  Data data;
  String message;
  bool success;

  StaticServices({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  factory StaticServices.fromJson(Map<String, dynamic> json) {
    return StaticServices(
      statusCode: json['statusCode'],
      data: Data.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
    );
  }
}

class Data {
  List<StaticService> staticServices;

  Data({
    required this.staticServices,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      staticServices: (json['staticServices'] as List)
          .map((e) => StaticService.fromJson(e))
          .toList(),
    );
  }
}

class StaticService {
  String id;
  String serviceImageUrl;
  String serviceName;
  int priority;
  String gender;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  StaticService({
    required this.id,
    required this.serviceImageUrl,
    required this.serviceName,
    required this.priority,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory StaticService.fromJson(Map<String, dynamic> json) {
    return StaticService(
      id: json['_id'],
      serviceImageUrl: json['serviceImageUrl'],
      serviceName: json['serviceName'],
      priority: json['priority'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
      gender: json['gender'],
    );
  }
}
