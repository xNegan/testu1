import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/models/post.dart';
import 'package:test1/repo/posts_repo.dart';
import 'package:http/http.dart' as http;

final httpPostsRepoProvider = Provider<HttpPostsRepo>((ref) {
  return HttpPostsRepo();
});

class HttpPostsRepo implements PostsRepo {
  @override
  Future<List<Post>> getPosts() async {
    const String link = 'https://jsonplaceholder.typicode.com/posts';
    //const String link = 'https://jsonplacehsolder.typicode.com/posts';

    final url = Uri.parse(link);
    final responseData = await http.get(url);
    final decodedResponse = jsonDecode(responseData.body) as List<dynamic>;
    return decodedResponse.map((e) => Post.fromJson(e)).toList();
  }
}
