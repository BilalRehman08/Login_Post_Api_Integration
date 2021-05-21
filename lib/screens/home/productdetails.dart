import 'package:flutter/material.dart';
import 'package:task/screens/home/home.dart';

class ProductDetails extends StatelessWidget {
  String userId;
  String id;
  String title;
  String body;
  ProductDetails(this.userId, this.id, this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
            centerTitle: true,
            title: Text("Product Details",
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          body: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "USER ID: $userId",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text("POST ID: $id",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text("TITLE: $title",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text("BODY: $body",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ]),
              ),
              height: 350,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  )),
            ),
          )),
    );
  }
}
