import 'package:calma/helper/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Controllers/user_controller.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final userControllerProvider = Provider<UserController>((ref) {
  final api = ref.read(apiServiceProvider);
  return UserController(api);
});
