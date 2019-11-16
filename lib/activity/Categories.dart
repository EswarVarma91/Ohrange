import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categoriesName=['Category 1','Category 2','Category 3','Category 4','Category 5','Category 6','Category 7','Category 8','Category 9','Category 10'];
  List<String> categoriesDesc=['Category 1 Desc' ,'Category 2 Desc','Category 3 Desc','Category 4 Desc','Category 5 Desc','Category 6 Desc' ,'Category 7 Desc','Category 8 Desc','Category 9 Desc','Category 10 Desc'];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(child: Container(padding: EdgeInsets.all(12.0),
      child: ListView(
        children: <Widget>[
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
                  trailing: Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,color: Colors.black,
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
                ),
              ),
            ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              height: MediaQuery.of(context).size.height * 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  scrollDirection: Axis.vertical,
                  itemCount: categoriesName.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 1,
                      child: Card(
                        color: Colors.green,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Center(
                                    child: Text(categoriesName[index].toString(),
                                  style:TextStyle(color: Colors.white, fontSize: 25.0),
                                )),
                              ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text(categoriesDesc[index].toString(),
                                  style:TextStyle(color: Colors.white, fontSize: 12.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
        ],
      ),),)
    );
  }
}
