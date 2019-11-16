import 'package:flutter/material.dart';
import 'package:ohrange/activity/ItemView.dart';
import 'package:dio/dio.dart';

import '../config/Config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "What would you like to have?",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                      ),
                      onPressed: () {},
                    ),
                    Positioned(
                      top: 10,
                      right: 12,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // boxShadow: [BoxShadow(color: Colors.green, offset: Offset(2, 1), blurRadius: 5)]
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Find food or Restuarant",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Category 1",
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "View More",
                        style: TextStyle(color: Colors.green),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              height: MediaQuery.of(context).size.height * 0.23,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Card(
                        color: Colors.green,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ItemView(numbers[index].toString())));
                          },
                          child: Container(
                            child: Center(
                                child: Text(
                              numbers[index].toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 36.0),
                            )),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Category 2",
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "View More",
                        style: TextStyle(color: Colors.green),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              height: MediaQuery.of(context).size.height * 0.23,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Card(
                        color: Colors.green,
                        child: Container(
                          child: Center(
                              child: Text(
                            numbers[index].toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 36.0),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Category 3",
                    style: TextStyle(color: Colors.green, fontSize: 18.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "View More",
                        style: TextStyle(color: Colors.green),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.green,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
              height: MediaQuery.of(context).size.height * 0.23,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Card(
                        color: Colors.green,
                        child: Container(
                          child: Center(
                              child: Text(
                            numbers[index].toString(),
                            style:
                                TextStyle(color: Colors.white, fontSize: 36.0),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

   getCategories() async {
    var dio = Dio();
    FormData formData = new FormData.fromMap({
    "srv": "category",
    "method": "GetCatServices",
  });
    var response = await dio.post(Config.services,
    data: formData,
    options: Options(responseType: ResponseType.json));
    print(response.data);

  }
}
