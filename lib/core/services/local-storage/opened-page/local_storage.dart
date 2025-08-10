import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveCurrentRoute(String route) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('last_route', route);
}

Future<String> getCurrentRoute() async {
  final prefs = await SharedPreferences.getInstance();
  final lastRoute = prefs.getString('last_route') ?? '/home';
  return lastRoute;
}
