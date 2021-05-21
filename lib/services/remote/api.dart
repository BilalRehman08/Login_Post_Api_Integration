import 'package:dio/dio.dart';
import 'package:task/models/post.dart';
import 'package:task/models/user.dart';
import 'package:task/utils/constants.dart';

class ApiService {
  Dio? _dio;

  ApiService() {
    _dio = Dio();
    Map<String, dynamic> customHeaders = Map<String, dynamic>();
    customHeaders['Content-Type'] = 'application/json';
    customHeaders['Accept'] = 'application/json';
    _dio
      ?..options.baseUrl = Constants.baseApiUrl
      ..httpClientAdapter
      ..options.headers = customHeaders;
  }

  Future<List<User>> getAllUsers() async {
    final response = await _dio?.get('/users');
    final allUsers = User.fromJsonList(response?.data);
    // print(allUsers);

    return allUsers;
  }

  Future<List<Posts>> getUserPosts(int userId) async {
    final response = await _dio?.get('/posts', queryParameters: {
      "userId": userId,
    });
    // print(response?.data);
    final allposts = response?.data;
    print("My List: " + "${allposts[0]['userId']}");
    // print(allposts);
    return allposts;
  }
}
