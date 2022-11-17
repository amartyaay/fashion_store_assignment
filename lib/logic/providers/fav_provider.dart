import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavNotifier extends StateNotifier<Map?> {
  Map<int, int> fav = {};

  FavNotifier() : super(null);
  void addFav(int value) {
    if (fav[value] != null) {
      fav.remove(value);
    } else {
      fav[value] = 1;
    }
    state = fav;
  }

  bool isFav(int value) {
    if ((state ?? {}).containsKey(value)) {
      return true;
    } else {
      return false;
    }
  }

  void increment(id) {
    if (state![id] != null) {
      fav[id] = fav[id]! + 1;
      state![id] = state![id] + 1;
    } else {
      fav[id] = 1;
      state![id] = 1;
    }
    // state = fav;
  }

  void decrement(id) {
    if (state![id] != null) {
      // fav[id] = fav[id]! - 1;
      state![id] = state![id] - 1;
    }
  }
}

final favProvider = StateNotifierProvider<FavNotifier, Map?>((ref) => FavNotifier());
