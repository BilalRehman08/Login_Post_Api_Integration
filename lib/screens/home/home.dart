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
            return Card(
                child: Hero(
                    tag: i,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                  "${allposts[i]['id']}",
                                  allposts[i]['title']))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(allposts[i]['title']),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            height: 25,
                            child: Text(allposts[i]['title'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 23)),
                          ),
                          SizedBox(height: 7),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                  size: 11,
                                ),
                                SizedBox(width: 1),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                  size: 11,
                                ),
                                SizedBox(width: 1),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                  size: 11,
                                ),
                                SizedBox(width: 1),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                  size: 11,
                                ),
                                SizedBox(width: 1),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                  size: 11,
                                ),
                                SizedBox(width: 2),
                                Text(
                                  "5.0 (23 Reviews)",
                                  style: TextStyle(fontSize: 11),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )));
          }),
    );
  }
}
