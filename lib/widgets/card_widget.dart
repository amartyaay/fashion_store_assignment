import 'package:fashion_store_assignment/constants/stylings.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logic/models/fonts.dart';

class CardWidget extends ConsumerWidget {
  final String title, image;
  final int index;
  final num price;
  final double fem;
  final double ffem;
  const CardWidget({
    required this.fem,
    required this.ffem,
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
                        title.substring(0, 3),
                        style: clothNameStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  // group11YUv (1:7)
                  width: double.infinity,
                  height: 24 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroup13q8JDC (UQsg2A5QM7Tqpoxg2A13q8)
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 57 * fem, 0 * fem),
                        width: 60 * fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              // EMk (1:10)
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
                        // autogroupfnsq3pz (UQsg8uPALHJ8tFXboEFNsQ)
                        width: 24 * fem,
                        height: 24 * fem,
                        child: IconButton(
                          splashColor: Colors.white,
                          onPressed: () {},
                          icon: !isFav
                              ? const Icon(Icons.shopping_bag_outlined)
                              : const Icon(Icons.shopping_bag),
                        ),
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
