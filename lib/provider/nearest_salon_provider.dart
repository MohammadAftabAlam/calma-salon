import 'package:calma/Model/salon_details_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calma/Data/salon_details_data.dart';

final salonDataProvider = Provider<List<SalonDetails>>((ref) {
  return salonDetailsData;
});

class NearestSalonNotifier extends StateNotifier<List<SalonDetails>>{
  final Ref ref;
  NearestSalonNotifier(this.ref) : super(salonDetailsData){
    _getNearestSalon();
  }

  _getNearestSalon(){
    final allSalons = ref.watch(salonDataProvider);
    state = allSalons.where((salonData) => salonData.distance <=5).toList();
  }
}

final nearestSalonProvider = StateNotifierProvider<NearestSalonNotifier, List<SalonDetails>>((ref){
  ref.watch(salonDataProvider);
  return NearestSalonNotifier(ref);
});

