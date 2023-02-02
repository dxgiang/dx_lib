import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/common/constant.dart';
import 'package:go_router_example/feature/setting/user/user_detail_info.dart';
import 'package:go_router_example/go_router/route_paths.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({Key? key, required this.user}) : super(key: key);

  final String user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: kPaddingAll16,
        child: ListView(
          children: [
            SizedBox(height: kPadding16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hi, $user',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Info',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    UserModel model = UserModel(
                      age: '22',
                      email: 'youremail@gmail.com',
                      address: 'Ho Chi Minh City',
                      userName: 'Alex',
                    );
                    context.goNamed(
                      RoutePaths.userDetailInfo,
                      params: {'name': 'Alex'},
                      extra: model,
                    );
                  },
                ),
                TextButton(
                  child: const Text(
                    'Comments',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    context.goNamed(
                      RoutePaths.comments,
                      params: {
                        "id": "1"
                      },
                    );
                  },
                )
              ],
            ),
            SizedBox(height: kPadding24 * 2),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () => context.pushNamed(
                  RoutePaths.changeTheme,
                  params: {'name': 'changeThemeMode'},
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: kPadding16, vertical: kPadding12),
                  child: const Text('Change Theme Mode'),
                ),
              ),
            ),
            SizedBox(height: kPadding16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.tealAccent),
                onPressed: () => context.goNamed(RoutePaths.homePage),
                child: Container(
                  padding: kPaddingAll16,
                  child: const Text(
                    'Go back to Home Page',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: kPadding16),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => context.go('/undefined'),
                child: Container(
                  padding: kPaddingAll16,
                  child: const Text(
                    'Go to Undefined route',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
