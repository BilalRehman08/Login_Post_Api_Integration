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
  submitForm() async {
    ApiService _apiService = ApiService();

    List<dynamic> eachposts = await _apiService.getUserPosts(10);
    setState(() {
      allposts = eachposts;
    });
    return allposts;
  }

  @override
  void initState() {
    super.initState();

    submitForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${allposts[0]['id']}"),
      ),
      body: ListView.builder(
          itemCount: allposts.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text("${allposts[i]['title']}"),
            );
          }),
    );
  }
}
