import '../models/post.dart';

abstract class PostsRepo {
  Future<List<Post>> getPosts();
}
