import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router_example/go_router/go_route.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
        
        // routeInformationParser: goRouter.routeInformationParser,
        // routerDelegate: goRouter.routerDelegate,
        // navigatorObservers: [RouterObserver()],
      ),
    ),
  );
}


/* class GoRouteListener implements PopNavigatorRouterDelegateMixin {
  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentConfiguration
  get currentConfiguration => throw UnimplementedError();

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => throw UnimplementedError();

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setInitialRoutePath(configuration) {
    // TODO: implement setInitialRoutePath
    throw UnimplementedError();
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

  @override
  Future<void> setRestoredRoutePath(configuration) {
    // TODO: implement setRestoredRoutePath
    throw UnimplementedError();
  }
} */

// ///*Anonymous Routing
// /// Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));

// ///*Generated Routing
// /// Navigator.pushNamed(context, "/splash");
// ///
// /// MaterialApp(
// ///   initialRoute: '/',
// ///   routes: {
// ///     '/':(context) => HomePage(),
// ///     '/splash' :(context) => SplashScreen(),
// ///   },
// /// )

// ///*Generated Routing
// /// Route routeSetting(RouteSettings settings) {
// ///   switch (settings.name) {
// ///     case '/home':
// ///       final data = settings.arguments;
// ///       return MaterialPageRoute(
// ///         builder: (_) => getHomePage(data),
// ///       );
// ///     case '/splash':
// ///       return MaterialPageRoute(
// ///         builder: (_) => SplashScreen(),
// ///       );
// ///     default:
// ///       return null;
// ///   }
// /// }

