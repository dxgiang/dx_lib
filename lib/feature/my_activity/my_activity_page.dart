import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/common/constant.dart';
import 'package:go_router_example/go_router/route_paths.dart';

class MyActivityWidget extends StatefulWidget {
  const MyActivityWidget({Key? key}) : super(key: key);

  @override
  State<MyActivityWidget> createState() => _MyActivityWidgetState();
}

class _MyActivityWidgetState extends State<MyActivityWidget>
    with AutomaticKeepAliveClientMixin<MyActivityWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Activity'),
      ),
      body: ListView.separated(
        padding: kPaddingAll16,
        itemCount: 20,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (BuildContext context, int index) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: kRadiusCircular8,
              onTap: () {
                context.pushNamed(
                  RoutePaths.detailActivity,
                  params: {'activityName': '$index'},
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: kRadiusCircular8,
                ),
                padding: kVerticalPadding16,
                child: Text(
                  'Activity $index',
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
