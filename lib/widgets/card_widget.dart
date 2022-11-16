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
    final p = price.toString();
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 2 - 20,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 13),
              width: 165,
              height: 180,
              child: Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              softWrap: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$ $p'),
                IconButton(
                  hoverColor: Colors.white,
                  splashRadius: 1,
                  onPressed: () {
                    // isFav = !isFav;
                  },
                  icon: isFav
                      ? const Icon(Icons.shopping_bag)
                      : const Icon(Icons.shopping_bag_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
