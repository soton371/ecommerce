import 'package:firebase/account.dart';
import 'package:firebase/prodoctsview.dart';
import 'package:firebase/testpage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/subcategorislist.dart';

class PageEight extends StatefulWidget {
  @override
  _PageEightState createState() => _PageEightState();
}

class _PageEightState extends State<PageEight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            width: MediaQuery.of(context).size.width/3,
            color: Colors.white,
            child: Text("Explore",
            style: TextStyle(
              color: Color(0xFFe7b35a),
              fontWeight: FontWeight.bold
            ),
            ),
          ),
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/3,
            color: Colors.white,
            child: Icon(Icons.add_shopping_cart, color: Color(0xFFe7b35a),),
          ),
          GestureDetector(
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Account())),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width/3,
              color: Colors.white,
              child: Icon(Icons.person_outline, color: Color(0xFFe7b35a),),
            ),
          )
        ],
      ),
        body: SingleChildScrollView(
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
            color: Color(0xFFe7b35a),
            //height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //all section this column
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Text(
                    "Categories",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white),
                  ),
                ),
                Container(
                  height: 150,
                  child: FutureBuilder(
                      future: Firestore.instance
                          .collection('Categories')
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
                                padding: EdgeInsets.only(left: 20, top: 20),
                                  child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SubCategoriesList(doc: doc,))),
                                    child: Container(
                                      padding:EdgeInsets.all(13),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: Colors.white),
                                        child: Image.network(doc["image"],width: 35, height: 35,)),
                                  ),
                                  SizedBox(height: 10,),
                                  Text(doc["categoriname"],
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
                ),
                //end categories section
                //start best selling section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Best Selling",
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
                  height: 320,
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
                        // return ListView.builder(
                        //     scrollDirection: Axis.horizontal,
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

                              return Container(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsView(product_name: doc.documentID,)));
                              },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.black
                                                ),
                                                color: Colors.white),
                                            child: ClipRRect(borderRadius: BorderRadius.circular(9),child: Image.network(doc["image"],width: 150, height: 190,fit: BoxFit.cover,))),
                                      ),
                                      SizedBox(height: 10,),
                                      Text(doc["title"],
                                        style: TextStyle(
                                            fontSize: 18,
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
                //end best selling section
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
