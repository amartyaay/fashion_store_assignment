import 'package:fashion_store_assignment/logic/providers/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logic/models/fonts.dart';

class ListWidget extends ConsumerWidget {
  final num price;
  final int id;
  final String title;
  final int quatity;
  final Color color;
  final String size;
  final double fem;
  final double ffem;
  final String image;
  const ListWidget({
    required this.image,
    required this.id,
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
      margin: EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 24 * fem),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 16 * fem),
            width: 80 * fem,
            height: 80 * fem,
            child: Image(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 231 * fem,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 18 * fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 66 * fem, 0 * fem),
                        constraints: BoxConstraints(
                          maxWidth: 113 * fem,
                        ),
                        child: Text(
                          title.substring(0, 12),
                          style: safeGoogleFont(
                            'Poppins',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xff1c1c19),
                          ),
                        ),
                      ),
                      Text(
                        '\$ $price',
                        textAlign: TextAlign.right,
                        style: safeGoogleFont(
                          'Poppins',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff1c1c19),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 20 * fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 3 * fem, 31 * fem, 3 * fem),
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 20 * fem, 0 * fem),
                              width: 36 * fem,
                              height: double.infinity,
                              child: SizedBox(
                                width: 36 * fem,
                                height: 18 * fem,
                                child: RichText(
                                  text: TextSpan(
                                    style: safeGoogleFont(
                                      'Poppins',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      color: const Color(0xffafbec4),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Size: ',
                                        style: safeGoogleFont(
                                          'Poppins',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          color: const Color(0xffafbec4),
                                        ),
                                      ),
                                      TextSpan(
                                        text: size,
                                        style: safeGoogleFont(
                                          'Poppins',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5 * ffem / fem,
                                          color: const Color(0xff1c1c19),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4 * fem),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 12 * fem, 0 * fem),
                                    child: Text(
                                      'Color',
                                      style: safeGoogleFont(
                                        'Poppins',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.5 * ffem / fem,
                                        color: const Color(0xffafbec4),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 14 * fem,
                                    height: 14 * fem,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4 * fem),
                                      color: color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20 * fem,
                              height: 20 * fem,
                              child: InkWell(
                                child: const Icon(Icons.remove),
                                onTap: () {
                                  ref.read(favProvider.notifier).decrement(id);
                                  print(ref.read(favProvider.notifier).fav);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 14 * fem,
                            ),
                            Consumer(builder: (context, ref, child) {
                              final l = ref.watch(favProvider);
                              int q = 0;
                              print('l is ');
                              print(l);
                              if (l != null) {
                                q = l[id];
                              }
                              return Text(
                                q.toString(),
                                style: safeGoogleFont(
                                  'Poppins',
                                  fontSize: 12 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5 * ffem / fem,
                                  color: const Color(0xff1c1c19),
                                ),
                              );
                            }),
                            SizedBox(
                              width: 14 * fem,
                            ),
                            SizedBox(
                              width: 20 * fem,
                              height: 20 * fem,
                              child: InkWell(
                                child: const Icon(
                                  Icons.add,
                                ),
                                onTap: () {
                                  ref.read(favProvider.notifier).increment(id);
                                  print(ref.read(favProvider.notifier).fav);
                                },
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
          ),
        ],
      ),
    );
  }
}
