import 'package:firebase/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  // String _email;
  // String _password;
  //
  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //
  // Future<void>singIn() async {
  //   final formstate = _formkey.currentState;
  //   if(formstate.validate()){
  //     formstate.save();
  //     try{
  //       FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  //     }
  //     catch(e){
  //       print(e.message);
  //     }
  //   }
  // }

  var email, password;

  singIn() async{
    FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    if(user != null){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }else{
      print('Something problem there');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),

      body: Form(
        //key: _formkey,
        child: Column(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(right: 25.0, left: 25.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Email"
                ),

             validator: (input){
               if(input.isEmpty){
                 return 'Please Type an e-mail';
               }else{
                 return null;
               }
             },
                onChanged: (input){
                  setState(() {
                    email = input;
                  });
                },

              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: TextFormField(
                onChanged: (input){
                  setState(() {
                    password = input;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),

             validator: (input){
               if(input.isEmpty){
                 return "Your password missing";
               }else{
                 return null;
               }
             },

              ),
            ),

            SizedBox(height: 20,),

            FlatButton(
              splashColor: Colors.grey,
              onPressed: (){
                setState(() {
                  singIn();
                });
              },
              child: Text("Login"),
              color: Colors.blue,
            ),



          ],
        ),
      ),
    );
  }
}
