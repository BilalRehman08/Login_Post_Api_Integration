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
  var each;
  submitForm() async {
    ApiService _apiService = ApiService();

    var eachposts = await _apiService.getUserPosts(1);
    setState(() {
      var each = eachposts;
    });
    return each;
  }

  @override
  void initState() {
    super.initState();
    submitForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: submitForm(),
            builder: (context, snapshot) {
              return Container(
                  child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        final postsss = snapshot.data;
                        return Text('${each!}');
                      }));
            }));
  }
}
