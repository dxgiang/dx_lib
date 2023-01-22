import 'package:flutter/material.dart';
import 'package:go_router_example/common/constant.dart';
import 'package:go_router_example/common/widgets/list_info.dart';

class UserModel {
  final String userName;
  final String age;
  final String email;

  final String address;
  UserModel({
    required this.userName,
    required this.age,
    required this.email,
    required this.address,
  });
}

class UserDetailInfo extends StatelessWidget {
  const UserDetailInfo({
    Key? key,
    required this.model,
  }) : super(key: key);
  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail Info'),
        centerTitle: true,
      ),
      body: ListView(
        padding: kHorizontalPadding16,
        children: [
          ListInfo(
            title: 'Name',
            content: model.userName,
          ),
          ListInfo(
            title: 'Age',
            content: model.age,
          ),
          ListInfo(
            title: 'Email',
            content: model.email,
          ),
          ListInfo(
            title: 'Address',
            content: model.address,
          ),
        ],
      ),
    );
  }
}
