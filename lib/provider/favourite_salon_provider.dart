import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calma/Model/salon_details_model.dart';

class FavouriteSalonNotifier extends StateNotifier<List<SalonDetails>> {
  FavouriteSalonNotifier() : super([]);

  toggleFavouriteSalonStatus(SalonDetails salonDetail){
    final isSalonFavourite = state.contains(salonDetail);

    if(isSalonFavourite){
      state = state.where((salon) => salon.id != salonDetail.id).toList();
      return true;
    }
    else{
      state = [...state, salonDetail];
      return false;
    }
  }
}

final favouriteSalonProvider = StateNotifierProvider((ref) {
  return FavouriteSalonNotifier();
});