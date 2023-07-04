class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Post fromJson(Map<String, dynamic> json) {
  //   return Post(
  //       userId: json['userId'],
  //       id: json['id'],
  //       title: json['title'],
  //       body: json['body']);
  // }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson(Post post) {
    return {
      'id': post.id,
      'user_id': post.userId,
      'title': post.title,
      'body': post.body,
    };
  }
}
