import 'package:fashion_store_assignment/screens/cart_screen.dart';
import 'package:fashion_store_assignment/screens/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screens = [const HomeView()];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: const Icon(Icons.menu_outlined),
        ),
        actions: const [
          Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
        ],
      ),
      body: screens[0],
      bottomNavigationBar: SizedBox(
        height: 96,
        child: GNav(
          rippleColor: Colors.grey,
          hoverColor: Colors.grey[100]!,
          gap: 13.2,
          activeColor: Colors.black,
          iconSize: 30,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          duration: const Duration(milliseconds: 300),
          tabBackgroundColor: Colors.grey.shade200,
          tabBorderRadius: 18,
          color: Colors.black,
          tabs: const [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: LineIcons.shoppingBag,
              text: 'Cart',
            ),
          ],
          onTabChange: (value) {
            if (value == 1) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const CartPage()),
              ));
            }
          },
        ),
      ),
    );
  }
}
