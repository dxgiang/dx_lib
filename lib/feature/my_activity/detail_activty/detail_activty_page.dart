import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/common/constant.dart';
import 'package:go_router_example/go_router/route_paths.dart';

class DetailActivityWidget extends StatelessWidget {
  const DetailActivityWidget({Key? key, required this.activityName})
      : super(key: key);
  final String activityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detail Activity'),
      ),
      body: Padding(
        padding: kPaddingAll16,
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: kRadiusCircular8,
              ),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                  horizontal: kPadding24 * 2, vertical: kPadding24 * 2),
              child: Text(
                activityName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: kPadding16),
            SizedBox(
              child: ElevatedButton(
                onPressed: () => context.goNamed(
                  RoutePaths.settings,
                  params: {'name': 'Alex'},
                ),
                child: Container(
                  padding: kPaddingAll16,
                  child: const Text(
                    'Go to Setting',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
