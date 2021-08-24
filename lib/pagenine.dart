import 'package:firebase/prodoctsview.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PageNine extends StatefulWidget {
  @override
  _PageNineState createState() => _PageNineState();
}

class _PageNineState extends State<PageNine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //start search section
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        width: MediaQuery.of(context).size.width / 1.4,
                        decoration: BoxDecoration(
                            color: Color(0xFFe0e0e0),
                            borderRadius: BorderRadius.circular(50)),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          cursorColor: Color(0xFFe7b35a),
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFFe7b35a),
                                size: 35,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFFe7b35a)),
                        child: Icon(Icons.camera_alt_outlined, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                //end search section
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFFe7b35a),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.centerLeft,
                        child: Text("Featured Brands",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      //SizedBox(height: 20,),
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
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Recommended",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "See All",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/1.79,
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
                              return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.documents.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    var doc = snapshot.data.documents[index];

                                    return Container(
                                        padding: EdgeInsets.only(top: 20, left: 20),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsView(product_name: doc.documentID,)));
                                              },
                                              //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SubCategoriesList(doc: doc,))),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white),
                                                  child: ClipRRect(borderRadius: BorderRadius.circular(0),child: Image.network(doc["image"],width: 150, height: 200,fit: BoxFit.cover,))),
                                            ),
                                            SizedBox(height: 10,),
                                            Text(doc["title"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                            Text("xion",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                            Text(doc["price"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300
                                              ),
                                            )
                                          ],
                                        ));
                                  });
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
