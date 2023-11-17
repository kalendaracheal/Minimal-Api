import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson_seven_ui/app/posts/models/post.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _UsersPageState();
}

Future<List<Post>> getPosts() async {
  try {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    // const url = 'localhost:8008/posts';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw 'Error occured while fetching';
    }
    final data = json.decode(response.body) as List;
    final post =
        data.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();

    debugPrint(post.first.message);

    return post;
  } catch (e) {
    debugPrint(e.toString());
    return [];
  }
}

class _UsersPageState extends State<PostsPage> {
  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
            child: FutureBuilder(
          future: getPosts(),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator.adaptive();
            }
            if (snapshot.hasError) {
              return const Text(
                'Error occured',
                style: TextStyle(fontSize: 20),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                final post = snapshot.data?[index];

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text('${post?.id ?? 0}'),
                    ),
                    // leading: CircleAvatar(child: Text(post?.userId ?? 0)),
                    title: Text(post?.title ?? ''),
                    subtitle: Text(post?.message ?? ''),
                  ),
                );
              },
            );
          },
        )),
      ),
      // backgroundColor: const Color.fromARGB(255, 233, 219, 235),
    );
  }
}
