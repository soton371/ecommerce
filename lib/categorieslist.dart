
import 'package:firebase/subcategorislist.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Container(
        child: FutureBuilder(
            future: Firestore.instance.collection('Categories').getDocuments(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index){
                  var doc = snapshot.data.documents[index];

                    return Container(
                      child: ListTile(
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SubCategoriesList(doc: doc,))),
                        title: Text(doc["categoriname"]),
                        trailing: Icon(Icons.arrow_forward_ios),
                      )
                    );
                  }
              );
            }
        ),
      ),
    );
  }
}

