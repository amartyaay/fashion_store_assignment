import 'package:fashion_store_assignment/constants/stylings.dart';
import 'package:fashion_store_assignment/logic/providers/quantity_price_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logic/models/fonts.dart';
import '../logic/providers/fav_provider.dart';

class CardWidget extends ConsumerWidget {
  final String title, image;
  final int index;
  final num price;
  final double fem;
  final double ffem;
  final int id;
  const CardWidget({
    required this.id,
    required this.fem,
    required this.ffem,
    required this.title,
    required this.image,
    required this.price,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 12 * fem),
      width: 165 * fem,
      height: 275 * fem,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 13 * fem),
            width: 165 * fem,
            height: 180 * fem,
            child: Image(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(12 * fem, 0 * fem, 12 * fem, 0 * fem),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      index % 2 == 0
                          ? Text(
                              'WAYF',
                              style: brandNameStyle,
                            )
                          : Text(
                              'NICOLE',
                              style: brandNameStyle,
                            ),
                      Text(
                        title.substring(0, 12),
                        style: clothNameStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 24 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 57 * fem, 0 * fem),
                        width: 60 * fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0 * fem,
                              top: 0 * fem,
                              child: Align(
                                child: SizedBox(
                                  width: 60 * fem,
                                  height: 24 * fem,
                                  child: Text(
                                    '\$ $price',
                                    style: safeGoogleFont(
                                      'Poppins',
                                      fontSize: 16 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5 * ffem / fem,
                                      color: const Color(0xff1c1c19),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 24 * fem,
                        height: 24 * fem,
                        child: IconButton(
                            splashColor: Colors.white,
                            onPressed: () {
                              ref.read(quantProvider.notifier).addFav(id);
                              final cart = ref.watch(favProvider);
                              if (!cart.contains(id)) {
                                ref.read(favProvider.notifier).addToCart(id);
                              } else {
                                ref.read(favProvider.notifier).removeFromCart(id);
                              }

                              // print(ref.watch(quantProvider.notifier).fav);
                            },
                            icon: Consumer(
                              builder: (context, ref, child) {
                                final cart = ref.watch(favProvider);

                                return cart.contains(id)
                                    ? const Icon(Icons.shopping_bag)
                                    : const Icon(Icons.shopping_bag_outlined);
                              },
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
