import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListWidget extends ConsumerWidget {
  final num price;
  final String title;
  final int quatity;
  final Color color;
  final Char size;
  final double fem;
  final double ffem;
  final String image;
  const ListWidget({
    required this.image,
    required this.fem,
    required this.ffem,
    required this.price,
    required this.title,
    required this.quatity,
    required this.color,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.all(24 * fem),
      child: Row(
        children: [
          SizedBox(
            height: 80 * fem,
            width: 80 * fem,
            child: Image(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 16 * fem),
          ),
        ],
      ),
    );
  }
}
