import 'package:fashion_store_assignment/logic/providers/providers.dart';
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
    final favProvider = ref.watch(apiProvider).when(
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
                style: safeGoogleFont(
                  'Poppins',
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.5 * ffem / fem,
                  letterSpacing: 0.8 * fem,
                  color: const Color(0xff1c1c19),
                ),
              ),
            ),
            body: SizedBox(
              width: 327 * fem,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container();
                },
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