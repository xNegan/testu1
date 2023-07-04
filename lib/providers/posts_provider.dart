import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/models/post.dart';

import '../repo/http_posts_repo.dart';

final postsProvider = FutureProvider<List<Post>>((ref) async {
  final httpProvider = ref.watch(httpPostsRepoProvider);
  return httpProvider.getPosts();
});
