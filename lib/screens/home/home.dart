import 'package:flutter/material.dart';
import 'package:task/models/user.dart';
import 'package:task/screens/home/productdetails.dart';
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

    List<dynamic> eachposts = await _apiService.getUserPosts(5);
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
      body: ListView.builder(
          itemCount: allposts.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                SizedBox(height: 20),
                Card(
                    color: Colors.purple,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  "${allposts[i]['userId']}",
                                  "${allposts[i]['id']}",
                                  "${allposts[i]['title']}",
                                  "${allposts[i]['body']}"))),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "USER ID: ${allposts[i]['userId']}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              Text("POST ID: ${allposts[i]['id']}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                              Text("TITLE: ${allposts[i]['title']}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                              Text("BODY: ${allposts[i]['body']}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                            ]),
                      ),
                    )),
              ],
            );
          }),
    );
  }
}
