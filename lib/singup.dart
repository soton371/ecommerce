import 'package:firebase/home.dart';
import 'package:firebase/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {

  var email, password, confirm_password;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //
  // Future<void>singUp() async {
  //   final formstate = _formkey.currentState;
  //   if(formstate.validate()){
  //     formstate.save();
  //     try{
  //       FirebaseUser firebaseUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  //     }
  //     catch(e){
  //       print(e.message);
  //     }
  //   }
  // }
  singUp() async{
    final FirebaseUser firebaseUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    if(firebaseUser != null && _formkey.currentState.validate()){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }else{
      print('Something problem there');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sing Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email"
                    ),
                    validator: (input){
                      if(input.isEmpty){
                        return "please enter email";
                      }else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(input)){
                        return "please enter valid email";
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

                  TextFormField(
                   obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                      errorStyle: TextStyle(
                        color: Color(0xFF7777FF)
                      ),
                      errorBorder: InputBorder.none,
                    ),
                    validator: (input){
                      if(input.isEmpty){
                        return "enter password";
                      }else{
                        return null;
                      }
                    },
                    onChanged: (input){
                      setState(() {
                        password = input;
                      });
                    },
                  ),

                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirm password",
                      errorStyle: TextStyle(
                          color: Color(0xFF7777FF)
                      ),
                      errorBorder: InputBorder.none,
                    ),
                    validator: (input){
                      if(input.isEmpty){
                        return "enter re-password";
                      }else if(password.toString() != confirm_password.toString()){
                        return "don't match";
                      }else{
                        return null;
                      }
                    },
                    onChanged: (input){
                      setState(() {
                        confirm_password = input;
                      });
                    },
                  ),
                  SizedBox(height: 25,),
                  FlatButton(
                    color: Colors.blue,
                      onPressed: (){
                        if(_formkey.currentState.validate()){
                          setState(() {
                            singUp();
                          });
                        }else{
                          print('object');
                        }
                      },
                      child: Text('Sing Up')
                  ),
                  SizedBox(height: 25,),
                  FlatButton(
                    color: Colors.blue,
                      onPressed: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Loginpage()));
                        });
                      },
                      child: Text('move to Log In page')
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}

