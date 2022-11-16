import 'package:fashion_store_assignment/logic/providers/providers.dart';
import 'package:fashion_store_assignment/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(apiProvider).when(
        data: (data) {
          return ListView(
            children: <Widget>[
              const Text('New Arrivals'),
              const SizedBox(height: 15.0),
              Container(
                  padding: const EdgeInsets.only(right: 15.0),
                  width: MediaQuery.of(context).size.width - 30.0,
                  height: MediaQuery.of(context).size.height - 50.0,
                  child: GridView.count(
                    crossAxisCount: 2,
                    primary: false,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 15.0,
                    childAspectRatio: 0.8,
                    children: listBuilder(data),
                  )),
              const SizedBox(height: 15.0)
            ],
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

List<Widget> listBuilder(data) {
  List<Widget> list = [];
  int n = data.length;
  for (int index = 0; index < n; index++) {
    list.add(
      CardWidget(
        title: data[index].title,
        image: data[index].image,
        price: data[index].price,
        index: index,
        isFav: data[index].isFav,
        // isFav: data[index].isFav,
      ),
    );
  }
  return list;
}
