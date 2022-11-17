import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavNotifier extends StateNotifier<List<int>> {
  FavNotifier() : super([]);
  void addToCart(int id) => state = [...state, id];
  void removeFromCart(int id) => state = [
        for (int i in state)
          if (i != id) i,
      ];
}

final favProvider = StateNotifierProvider<FavNotifier, List<int>>((ref) => FavNotifier());

class QuantityNotifier extends StateNotifier<List<int>> {
  QuantityNotifier() : super([0, 0, 0]);
  void increaseQuantity(id) => state[id] = state[id] + 1;
  void decreaseQuant(id) => state[id]--;
}

final qunatityProvider = StateNotifierProvider<QuantityNotifier, List<int>>(
  (ref) => QuantityNotifier(),
);
