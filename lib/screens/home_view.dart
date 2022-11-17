import 'package:fashion_store_assignment/logic/providers/providers.dart';
import 'package:fashion_store_assignment/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logic/models/fonts.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double basewidth = 375;
    double fem = MediaQuery.of(context).size.width / basewidth;
    double ffem = 0.97 * fem;
    return ref.watch(apiProvider).when(
        data: (data) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 24 * ffem),
                  child: Text(
                    'New Arrivals',
                    style: safeGoogleFont(
                      'Poppins',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.5 * ffem / fem,
                      letterSpacing: 0.7 * fem,
                      color: const Color(0xff1c1c19),
                    ),
                  ),
                ),
                const SizedBox(height: 19.0),
                SizedBox(
                  height: data.length.isEven ? data.length / 2 * 300 : (data.length + 1) / 2 * 300,
                  child: ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: false,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (data.length % 2 != 0 && index == data.length - 1) {
                        return Row(
                          children: [
                            CardWidget(
                              fem: fem,
                              ffem: ffem,
                              title: data[index].title,
                              image: data[index].image,
                              price: data[index].price,
                              index: index,
                              isFav: false,
                            ),
                            SizedBox(
                              width: 165 * fem,
                            )
                          ],
                        );
                      } else if (index.isEven) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CardWidget(
                              fem: fem,
                              ffem: ffem,
                              title: data[index].title,
                              image: data[index].image,
                              price: data[index].price,
                              index: index,
                              isFav: data[index].isFav,
                            ),
                            CardWidget(
                              fem: fem,
                              ffem: ffem,
                              title: data[index + 1].title,
                              image: data[index + 1].image,
                              price: data[index + 1].price,
                              index: index + 1,
                              isFav: data[index + 1].isFav,
                            ),
                          ],
                        );
                      } else {
                        return const SizedBox(
                          height: 0,
                          width: 0,
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 15.0)
              ],
            ),
          );
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: ((error, stackTrace) => Center(
              child: Text(error.toString()),
            )));
  }
}

List<Widget> listBuilder(data, fem, ffem) {
  List<Widget> list = [];
  int n = data.length;
  for (int index = 0; index < n; index + 1) {
    list.add(
      CardWidget(
        title: data[index].title,
        image: data[index].image,
        price: data[index].price,
        index: index,
        isFav: data[index].isFav,
        fem: fem,
        ffem: ffem,
        // isFav: data[index].isFav,
      ),
    );
  }
  return list;
}
