import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/common/constant.dart';
import 'package:go_router_example/go_router/route_paths.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: Padding(
        padding: kPaddingAll16,
        child: Column(
          children: [
            const Text(
              'Page Not Found',
              style: TextStyle(
                fontSize: 48,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: kPadding16),
            Center(
              child: ElevatedButton(
                onPressed: () => context.go(RoutePaths.homePage),
                child: Text(
                  "Go to home page".toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
