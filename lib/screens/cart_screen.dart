import 'package:fashion_store_assignment/constants/stylings.dart';
import 'package:fashion_store_assignment/logic/providers/fav_provider.dart';
import 'package:fashion_store_assignment/logic/providers/providers.dart';
import 'package:fashion_store_assignment/widgets/list_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../logic/models/fonts.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    Map lst = ref.watch(favProvider) ?? {};
    return ref.watch(apiProvider).when(
        data: (data) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              title: Text(
                'Your Cart',
                style: cartPageStyle,
              ),
            ),
            body: Center(
              child: SizedBox(
                width: 350 * fem,
                // height: lst.length * 240,
                child: Column(
                  children: [
                    Expanded(
                      child: Consumer(builder: (context, ref, child) {
                        Map list = ref.watch(favProvider) ?? {};
                        return SizedBox(
                          height: list.length * 240,
                          child: ListView.builder(
                            itemCount: data.length,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              if (list.containsKey(data[index].id)) {
                                return ListWidget(
                                    image: data[index].image,
                                    fem: fem,
                                    ffem: ffem,
                                    price: data[index].price,
                                    title: data[index].title,
                                    quatity: list[data[index].id],
                                    id: data[index].id,
                                    color: Colors.black,
                                    size: 'S');
                              } else {
                                return const SizedBox(
                                  height: 0,
                                  width: 0,
                                );
                              }
                            },
                          ),
                        );
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Total Price',
                          style: cartPageStyle,
                        ),
                        Text(
                          '\$ totalPrice',
                          style: cartPageStyle,
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 16 * fem, 0, 40 * fem),
                        height: 64 * fem,
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.black),
                        child: Center(
                          child: Text(
                            'Payment',
                            style: safeGoogleFont(
                              'Poppins',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5 * ffem / fem,
                              letterSpacing: 0.8 * fem,
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        error: ((error, stackTrace) => Center(child: Text(error.toString()))),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
