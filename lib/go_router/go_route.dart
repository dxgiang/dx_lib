import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/feature/error_screen/error_screen.dart';
import 'package:go_router_example/feature/home_page.dart';
import 'package:go_router_example/feature/my_activity/detail_activty/detail_activty_page.dart';
import 'package:go_router_example/feature/setting/change_theme/change_theme_mode_page.dart';
import 'package:go_router_example/feature/setting/user/user_detail_info.dart';
import 'package:go_router_example/go_router/route_paths.dart';

import '../feature/my_activity/my_activity_page.dart';
import '../feature/setting/setting_page.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    GoRoute(
      name: RoutePaths.homePage,
      path: '/',
      builder: (context, state) => const HomePageWidget(),
      routes: [
        GoRoute(
          name: RoutePaths.settings,
          path: 'settings/:name',
          builder: (context, state) {
            return SettingWidget(
              user: state.params['name']!,
            );
          },
          routes: [
            GoRoute(
              name: RoutePaths.changeTheme,
              path: 'changeTheme',
              builder: (context, state) => const ChangeThemeModeWidget(),
            ),
            GoRoute(
              name: RoutePaths.userDetailInfo,
              path: 'userDetailInfo',
              builder: (context, state) {
                state.queryParams.forEach(
                  (key, value) {
                    log("Key is: $key: \n Value is:$value");
                  },
                );
                UserModel model = state.extra as UserModel;
                return UserDetailInfo(
                  model: model,
                );
              },
            ),
          ],
        ),
        GoRoute(
          name: RoutePaths.myActivity,
          path: 'myActivity',
          builder: (context, state) {
            return const MyActivityWidget();
          },
          routes: [
            GoRoute(
              name: RoutePaths.detailActivity,
              path: 'detailActivity/:activityName',
              builder: (context, state) {
                return DetailActivityWidget(
                  activityName: state.params['activityName']!,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => const ErrorScreen(),
);
