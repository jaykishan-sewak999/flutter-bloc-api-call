import 'package:git_block_demo/api/api_provider.dart';
import 'package:git_block_demo/model/user.dart';
import 'package:http/http.dart' as http;

class APIRepository {
  final APIProvider apiProvider;

  APIRepository({required this.apiProvider});

  Future< List<User>> fetchUsers() async{

    final response = await apiProvider.fetchUsers();
    return User.fromJsonList(response.body);
  }
}
