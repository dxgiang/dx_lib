import 'dart:developer';

import 'package:flutter/material.dart';

class RouterObserver extends NavigatorObserver {
  static String name = RouterObserver.name;
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    log('${route.settings.name}, ${route.settings.arguments}',
        name: '$name pop');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    log('${route.settings.name}, ${route.settings.arguments}',
        name: '$name push');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    log('${route.settings.name}, ${route.settings.arguments}',
        name: '$name remove');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    // super.didReplace(newRoute, oldRoute);
    log('${newRoute?.settings.name}, ${newRoute?.settings.arguments}',
        name: '$name replace');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    log('${route.settings.name}, ${route.settings.arguments}',
        name: '$name startUserGesture');
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }
}
