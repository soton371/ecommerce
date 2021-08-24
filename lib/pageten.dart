import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PageTen extends StatefulWidget {
  @override
  _PageTenState createState() => _PageTenState();
}

class _PageTenState extends State<PageTen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          Container(
            alignment: Alignment.center,
            color: Colors.white,
            height: 60,
            width: MediaQuery.of(context).size.width/2,
            child: Text("No filters applied",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFe7b35a),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            color: Colors.white,
            height: 60,
            width: MediaQuery.of(context).size.width/2,
            child: FlatButton(
              minWidth: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: Color(0xFFe7b35a),
                onPressed: (){}, 
                child: Text("FILTER",
                style: TextStyle(
                  color: Colors.white,
                ),
                )
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //search section start
            Container(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text("Gadgets",
                  style: TextStyle(
                    fontSize: 25
                  ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFF00c569)
                    ),
                    child: Icon(Icons.search, color: Colors.white,),
                  ),
                ],
              ),
            ),
            //end search setion
            //start top brands section
            Container(
              color: Color(0xFFe7b35a),
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text("Top Brands",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              color: Color(0xFFe7b35a),
              height: 100,
              child: FutureBuilder(
                  future: Firestore.instance
                      .collection('Brand')
                      .getDocuments(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          var doc = snapshot.data.documents[index];

                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Row(

                                children: [
                                  Image.network(doc["image"], height: 100,width: 100,),
                                  //Image.asset("images/10521324.png",height: 100,width: 100,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(doc["name"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25
                                        ),
                                      ),
                                      Text(doc["totalproducts"],
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            ),
            //end top brands section
            // start products section
            Container(
              color: Color(0xFFe7b35a),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                  future: Firestore.instance
                      .collection('Audi')
                      .getDocuments(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                        physics: ScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 2/3.25,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10
                        ),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          var doc = snapshot.data.documents[index];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: Image.network(doc["image"], height: 200, fit: BoxFit.cover,),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              SizedBox(height: 10,),
                              Text(doc["title"],
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              ),
                              Text(doc["price"],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300
                                ),
                              ),
                            ],
                          );
                        });
                  }),
            ),
            // end products section
          ],
        ),
      ),
    );
  }
}
