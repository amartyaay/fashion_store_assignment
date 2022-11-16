import 'package:fashion_store_assignment/logic/api/api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiProvider = FutureProvider(
  (ref) async {
    return await ref.read(api).apiCall();
  },
);
