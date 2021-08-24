import 'package:firebase/pagenine.dart';
import 'package:firebase/prodoctsview.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubCategoriesList extends StatefulWidget {
  var doc;
  SubCategoriesList({this.doc});

  @override
  _SubCategoriesListState createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.doc!=null?Text(widget.doc["categoriname"]):Text("Not available"),
      ),
      body: Container(
        child: FutureBuilder(
            future: Firestore.instance.collection('Categories').document(widget.doc.documentID).get(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data["subcategories"];
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                        child: ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PageNine()));
                          },
                          title: Text(data[index]),
                        )
                    );
                  }
              );
            }
        ),
      )
    );
  }
}
