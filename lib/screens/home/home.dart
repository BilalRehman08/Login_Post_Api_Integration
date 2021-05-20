import 'package:flutter/material.dart';
import 'package:task/models/user.dart';
import 'package:task/services/remote/api.dart';

class Home extends StatelessWidget {
  final User? user;

  const Home({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(user),
    );
  }
}

class _Body extends StatefulWidget {
  final User? user;

  const _Body(this.user);

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  List postsLists = [];
  submitForm(BuildContext context) async {
    ApiService _apiService = ApiService();

    final allposts = await _apiService.getUserPosts(1);
    postsLists = allposts.toList();
  }

  @override
  void initState() {
    super.initState();

    submitForm(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: postsLists.length,
          itemBuilder: (context, index) {
            return Text(postsLists[index]);
          }),
    );
  }
}
