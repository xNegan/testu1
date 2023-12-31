import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefrencesProvider = Provider((ref) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs;
});
