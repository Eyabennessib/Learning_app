import 'package:flutter/widgets.dart';
import 'package:dummy_app/core/services/local-storage/opened-page/local_storage.dart';

class RoutePersistenceObserver extends NavigatorObserver {
  void _save(Route<dynamic>? route) {
    final name = route?.settings.name;
    if (name != null) {
      saveCurrentRoute(name);
    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _save(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _save(newRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _save(previousRoute);
  }
}
