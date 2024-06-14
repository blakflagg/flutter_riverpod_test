import 'package:flutter_riverpod/flutter_riverpod.dart';

class HelloProvider {
  String _message = "Hello to this world";
  String get msg => _message;
}

final helloWorldProvider = Provider<HelloProvider>((ref) => HelloProvider());
