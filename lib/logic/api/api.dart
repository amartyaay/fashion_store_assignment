import 'dart:convert';

import 'package:fashion_store_assignment/logic/models/clothes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class GetData {
  List<Clothes> clothCollection = [];
  final apiUrl = 'https://fakestoreapi.com/products?limit=3';
  Future<List<Clothes>> apiCall() async {
    final res = await http.get(
      Uri.parse(apiUrl),
    );
    final jsonData = jsonDecode(res.body);
    jsonData.forEach((e) {
      Clothes cloth = Clothes(
        id: e['id'],
        title: e['title'],
        price: e['price'],
        description: e['description'],
        image: e['image'],
      );
      clothCollection.add(cloth);
    });
    return clothCollection;
  }

  List getClothList() {
    return clothCollection;
  }
}

final api = Provider(
  (ref) => GetData(),
);
