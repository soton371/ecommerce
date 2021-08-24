import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsView extends StatefulWidget {
  var product_name;
  ProductsView({this.product_name});

  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
           SizedBox(width: 20,),
          widget.product_name.toString() == "LRaRpezGOIoPFaKmrStp"?FutureBuilder(
              future: Firestore.instance.collection('Audi').document(widget.product_name.toString()).get(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapshot.data;
                return Text(data["price"],
                  style: TextStyle(
                      color: Color(0xffe99400),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                )??"NA";
              }
          ):Text(""),
          widget.product_name.toString() == "MPYZ6fXHLJSIPR1mMrX8"?FutureBuilder(
              future: Firestore.instance.collection('Audi').document(widget.product_name.toString()).get(),
              builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapshot.data;
                return Text(data["price"],
                  style: TextStyle(
                      color: Color(0xffe99400),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                )??"NA";
              }
          ):Text(""),
          Spacer(),
          FlatButton(
              color: Color(0xffe99400),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              onPressed: (){
                
              }, 
              child: Text("ADD",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              )
          ),
          SizedBox(width: 20,),
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.product_name.toString() == "LRaRpezGOIoPFaKmrStp"?FutureBuilder(
            future: Firestore.instance.collection('Audi').document(widget.product_name.toString()).get(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data;
              return Column(
                children: [
                  Image.network(data["image"])??"NA",
                  Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(20),
                    color: Color(0xffe99400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data["title"],
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        )??"NA",
                        SizedBox(height: 15,),
                        Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: Colors.white
                                ),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Row(
                                children: [
                                  Text("Horse Power  ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                    ),
                                  ),
                                  Text(data['hint'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                    ),
                                  )
                                ],
                              )
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5,
                                        color: Colors.white
                                    ),
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: Row(
                                  children: [
                                    Text(data['color'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20
                                      ),
                                    )
                                  ],
                                ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15,),
                        Text("Details:",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                        SizedBox(height: 15,),
                        Text(data["details"],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        )??"NA",
                      ],
                    ),
                  ),
                ],
              );
            }
        ):Text(""),
            widget.product_name.toString() == "MPYZ6fXHLJSIPR1mMrX8"?FutureBuilder(
                future: Firestore.instance.collection('Audi').document(widget.product_name.toString()).get(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  var data = snapshot.data;
                  return Column(
                    children: [
                      Image.network(data["image"])??"NA",
                      Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(20),
                        color: Color(0xffe99400),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data["title"],
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            )??"NA",
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5,
                                            color: Colors.white
                                        ),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Row(
                                      children: [
                                        Text("Horse Power  ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20
                                          ),
                                        ),
                                        Text(data['hint'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20
                                          ),
                                        )
                                      ],
                                    )
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1.5,
                                          color: Colors.white
                                      ),
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Row(
                                    children: [
                                      Text(data['color'],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Text("Details:",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text(data["details"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              ),
                            )??"NA",
                          ],
                        ),
                      ),
                    ],
                  );
                }
            ):Text(""),
          ],
        ),
      )
    );
  }
}

