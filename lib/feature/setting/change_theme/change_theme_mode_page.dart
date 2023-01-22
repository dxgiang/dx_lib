import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/common/constant.dart';
import 'package:go_router_example/go_router/route_paths.dart';

class ChangeThemeModeWidget extends StatelessWidget {
  const ChangeThemeModeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Change Theme Mode'),
      ),
      body: Container(
        padding: kPaddingAll16,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () =>
              context.goNamed(RoutePaths.settings, params: {'name': 'Alex'}),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: kPadding16, vertical: kPadding16),
            child: const Text('Update Dark Theme'),
          ),
        ),
      ),
    );
  }
}
