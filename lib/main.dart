import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router_example/go_router/go_route.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //Remove this method to stop OneSignal Debugging
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("a96962ef-88fe-4d34-baef-8f79085ede4f");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
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

