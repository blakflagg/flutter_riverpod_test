import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../models/random.dart';

final activityProvider = FutureProvider.autoDispose((ref) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response =
      await http.get(Uri.https('www.randomnumberapi.com', '/api/v1.0/random'));
  // Using dart:convert, we then decode the JSON payload into a Map data structure.
  // final json = jsonDecode(response.body) as Map<String, dynamic>;
  // Finally, we convert the Map into an Activity instance.
  // return Activity.fromJson(json);
  print('response ${response.body}');
  final json = jsonDecode(response.body);
  print(json);
  // return Random(jsonDecode(response.body));
  // return Random.fromJson(json);
  return Random(json);
});
