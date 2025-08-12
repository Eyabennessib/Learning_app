import 'package:flutter/widgets.dart';

import '../services/local-storage/opened-page/local_storage.dart';

class RoutePersistenceObserver extends NavigatorObserver {
  Future<void> _save(String? name) async {
    if (name != null) {
      await saveCurrentRoute(name);
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    super.didPush(route, previousRoute);
    await _save(route.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    super.didPop(route, previousRoute);
    await _save(previousRoute?.settings.name);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) async {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    await _save(newRoute?.settings.name);
  }
}
