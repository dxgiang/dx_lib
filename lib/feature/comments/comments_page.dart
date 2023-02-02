import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:go_router_example/common/constant.dart';
import 'package:go_router_example/common/widgets/list_info.dart';
import 'package:go_router_example/feature/comments/model.dart';

class CommentsPage extends StatefulWidget {
  final String id;
  const CommentsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late Future<List<Comments>> futureComments;
  @override
  void initState() {
    super.initState();
    futureComments = fetchComment(widget.id);
  }

  Future<List<Comments>> fetchComment(String id) async {
    final res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$id'));
    try {
      if (res.statusCode == 200) {
        log(res.body);
        return (json.decode(res.body) as List)
            .map((e) => Comments.fromJson(e))
            .toList();
      } else {
        throw Exception("Failed to load comments");
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments Page"),
        centerTitle: true,
      ),
      body: Center(
          child: FutureBuilder<List<Comments>>(
        future: futureComments,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            final List<Comments> data = snapshot.data as List<Comments>;
            return ListView.builder(
              padding: kPaddingAll16,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListInfo(
                        title: 'PostID',
                        content: data[index].postId.toString()),
                    ListInfo(title: 'ID', content: data[index].id.toString()),
                    ListInfo(title: 'Name', content: data[index].name),
                    ListInfo(title: 'Email', content: data[index].email),
                    ListInfo(title: 'Body', content: data[index].body)
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Container(color: Colors.red);
          }
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
