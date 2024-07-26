import 'dart:convert';

class User {
  final String login;
  final String avtarUrl;
  final int id;
  final String htmlUrl;

  User(
      {required this.login,
      required this.avtarUrl,
      required this.id,
      required this.htmlUrl});

  factory User.fromJson(Map < String, dynamic > json) {
    return User( login: json['login'],  id: json['id'],  avtarUrl: json['avatar_url'],  htmlUrl: json['html_url'],  );
  }

  static List < User > fromJsonList(String jsonString) {
    final List < dynamic > jsonList = json.decode(jsonString);
    return jsonList.map((json) => User.fromJson(json)).toList();
  }
}
