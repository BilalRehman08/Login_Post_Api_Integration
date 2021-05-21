import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  String prod_name;
  String prod_picture;
  ProductDetails(this.prod_name, this.prod_picture);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text("Item Details", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: prod_picture,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(prod_picture),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(height: 8),
                      Align(
                          child: Text(prod_name,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          alignment: Alignment.centerLeft),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 15,
                    ),
                    SizedBox(width: 1),
                    Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 15,
                    ),
                    SizedBox(width: 1),
                    Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 15,
                    ),
                    SizedBox(width: 1),
                    Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 15,
                    ),
                    SizedBox(width: 1),
                    Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                      size: 15,
                    ),
                    SizedBox(width: 2),
                    Text(
                      "5.0 (23 Reviews)",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('20 Pieces', style: TextStyle(fontSize: 15)),
                    SizedBox(width: 2),
                    Text(
                      '\$90',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 25),
                Text("Production Description",
                    style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                SizedBox(height: 20),
                Text("Reviews",
                    style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold)),
              ],
            )),
      ),
      bottomNavigationBar: BottomAppBar(
        child: FlatButton(
          onPressed: () {},
          color: Colors.red,
          child: Text("ADD TO CART", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
