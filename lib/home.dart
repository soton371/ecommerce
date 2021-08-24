
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {

  // FirebaseUser firebaseUser;
  // Home({this.firebaseUser});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  var name,address,mobileno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
                child: Icon(Icons.logout)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Ur name"
                ),
                onChanged: (input){
                  name = input;
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Ur address"
                ),
                onChanged: (input){
                  address = input;
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Ur mobile no"
                ),
                onChanged: (input){
                  mobileno = input;
                },
              ),
              SizedBox(height: 30,),
              //for sent data database
              FlatButton(
                  onPressed: (){
                    Firestore.instance.collection('Info').add({
                      'Name':name,
                      'Address':address,
                      'Mobile No':mobileno
                    });
                  },
                  child: Text('Send Data'),
                color: Colors.blue,
              ),

              SizedBox(height: 20,),
              Text('Below Show All Data'),
              SizedBox(height: 10,),
              Divider(height: 2, color: Colors.grey,),
              SizedBox(height: 20,),
              StreamBuilder(
                stream: Firestore.instance.collection('Info').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(!snapshot.hasData){
                      return Text('no value');
                    }else{
                      return Column(
                        children:
                          snapshot.data.documents.map((e) {
                            return Column(
                              children: [
                                Text(e['Name'] ?? 'N/A Name'),
                                Text(e['Address'] ?? 'N/A Address'),
                                Text(e['Mobile No'] ?? 'N/A Mobile No'),
                                Text('\n')
                              ],
                            );
                          }).toList()
                      );
                    }
                  }
              )
            ],
          ),
        ),
      )
    );
  }
}
