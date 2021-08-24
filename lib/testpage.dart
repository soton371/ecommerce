import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TestPage extends StatefulWidget {

  var docid;
  TestPage({this.docid});
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        height: 200,
        width: 200,
        child: FutureBuilder(
            future: Firestore.instance.collection('Audi').document(widget.docid.documentID).get(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              var data = snapshot.data.documentID;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                        child: ListTile(
                          onTap: (){
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductsView(product_name: data[index],)));
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
