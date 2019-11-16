import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  String index;
  ItemView(this.index);
  

  @override
  _IteamViewState createState() => _IteamViewState(index);
}

class _IteamViewState extends State<ItemView> {

   int _quantity = 1;

  void _increment(){
    setState(() {
      _quantity++;
    });
  }

  void _decrement(){
    if(_quantity>1) {
      setState(() {
        _quantity--;
      });
    }
  }

  String index;
 _IteamViewState(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, appBar:  AppBar(backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.black)), body:
         SafeArea(child:
           Column(children: <Widget>[
             Container(padding: EdgeInsets.symmetric(horizontal: 20), height: MediaQuery.of(context).size.height*0.73, child:
               SingleChildScrollView(child:
                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                   Container(margin: EdgeInsets.only(top: 20), child:
                     Text("Something "+index, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black)),
                  ),
                   Container(margin: EdgeInsets.only(top: 10), child:
                     Text("1 Liter", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey)),
                  ),
                   Container(margin: EdgeInsets.only(top: 20), child:
                       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                         Container(padding: EdgeInsets.all(10), decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(50)), child:
                           Row(children: <Widget>[
                             InkWell(
                              child:  Icon(Icons.remove, size: 15,),
                              onTap: _decrement,
                            ),
                             Padding(padding: EdgeInsets.symmetric(horizontal: 20), child:  Text(_quantity.toString(), style: TextStyle(fontSize: 20))),
                             InkWell(
                              child:  Icon(Icons.add, size: 15,),
                              onTap: _increment,
                            ),
                          ]),
                        ),
                         Text("\₹${(10*_quantity).toStringAsFixed(2)}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35, color: Colors.black)),
                      ])
                  ),
                   Container(margin: EdgeInsets.only(top: 40, bottom: 40), child:
                     Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                       Text("About the item:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                       Padding(padding: EdgeInsets.only(top: 10), child:  Text("Description about the item in detail "+index, style: TextStyle(color: Colors.grey, fontSize: 18)))
                    ])
                  )
                ])
              )
            ),
             Container(decoration: BoxDecoration(boxShadow:  [
              BoxShadow(
                color: Colors.white,
                blurRadius: 30.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  -20.0, // vertical, move down 10
                ),
              )
            ]), padding: EdgeInsets.symmetric(horizontal: 20), height: MediaQuery.of(context).size.height*0.1, child:
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                 FlatButton.icon(onPressed: (){}, icon:  Icon(Icons.favorite_border), label:  Text("")),
                 SizedBox(width: MediaQuery.of(context).size.width * 0.6, child:
                   RaisedButton(color: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)), padding: EdgeInsets.all(20),
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child:  Text("Add to cart", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))
                  )
                )
              ]),
            )
          ])
      )
    );
  }
}