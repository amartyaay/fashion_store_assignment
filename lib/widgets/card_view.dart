import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CardWidget extends ConsumerWidget {
  final String title, image;
  final int index;
  final num price;
  const CardWidget({
    required this.title,
    required this.image,
    required this.price,
    required this.index,
    required this.isFav,
    super.key,
  });
  final bool isFav;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
