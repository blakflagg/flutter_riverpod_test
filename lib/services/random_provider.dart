import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/random.dart';

class RandomProvider extends AutoDisposeAsyncNotifier<Random> {
  @override
  Future<Random> build() async {
    return getRandomNumberFromAPI();
  }

  Future<Random> getRandomNumberFromAPI() async {
    final response = await http
        .get(Uri.https('www.randomnumberapi.com', '/api/v1.0/random'));
    final json = jsonDecode(response.body);
    return Random(json);
  }

  Future<Random> getRandomNumberFromAPI2() async {
    final response = await http
        .get(Uri.https('www.randomnumberapi.comm', '/api/v1.0/random'));
    final json = jsonDecode(response.body);
    return Random(json);
  }

  Future<void> updateRandomNumber() async {
    // Random rNum = await getRandomNumberFromAPI();
    // state = AsyncData(rNum);
    state = AsyncData(await getRandomNumberFromAPI2());
  }
}

final randomProvider =
    AsyncNotifierProvider.autoDispose<RandomProvider, Random>(
  RandomProvider.new,
);
