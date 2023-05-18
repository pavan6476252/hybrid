
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveProvider<T> extends StateNotifier<Box<T>> {
  final String boxName;

  HiveProvider(this.boxName) : super(_openBox<T>(boxName));

  static Box<T> _openBox<T>(String boxName) {
    Hive.initFlutter();
    return Hive.box(boxName);
  }

  @override
  void dispose() {
    super.dispose();
    state.close();
  }
}


