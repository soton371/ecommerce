import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe99400),
      bottomNavigationBar: Row(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/3,
            color: Colors.white,
            child: Icon(Icons.explore_outlined, color: Colors.black,),
          ),

          Container(
            height: 60,
            width: MediaQuery.of(context).size.width/3,
            color: Colors.white,
            child: Icon(Icons.add_shopping_cart, color: Colors.black,),
          ),

          Container(
            alignment: Alignment.center,
            height: 60,
            width: MediaQuery.of(context).size.width/3,
            color: Colors.white,
            child: Text("Account",
              style: TextStyle(
                  color: Color(0xFFe99400),
                  //fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left:20, right: 20, top: 60, bottom: 20),
          child: Column(
            children: [
              //Name Pic section
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/john.jpg"),
                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("John Wick",
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white
                      ),
                      ),
                      Text("johnwick@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            //fontSize: 28,
                            color: Colors.white
                        ),
                      )
                    ],
                  )
                ],
              ),
              //Name Pic section end
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.centerLeft,
                  child: Text("Edit Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                    fontSize: 20,
                    color: Colors.white
                  ),
                  )
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFfee35c)
                    ),
                    child: Icon(Icons.location_on_outlined),
                  ),
                  SizedBox(width: 20,),
                  Text("Shipping Address",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFfee35c)
                    ),
                    child: Icon(Icons.favorite_border),
                  ),
                  SizedBox(width: 20,),
                  Text("Wishlist",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFe80057)
                    ),
                    child: Text("New",
                    style: TextStyle(
                      //fontSize: 15,
                      color: Colors.white
                    ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFfee35c)
                    ),
                    child: Icon(Icons.border_all),
                  ),
                  SizedBox(width: 20,),
                  Text("Order History",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFfee35c)
                    ),
                    child: Icon(Icons.track_changes),
                  ),
                  SizedBox(width: 20,),
                  Text("Track Order",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFfee35c)
                    ),
                    child: Icon(Icons.credit_card),
                  ),
                  SizedBox(width: 20,),
                  Text("Cards",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFfee35c)
                    ),
                    child: Icon(Icons.notification_important_outlined),
                  ),
                  SizedBox(width: 20,),
                  Text("Notifications",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFfee35c)
                    ),
                    child: Icon(Icons.logout),
                  ),
                  SizedBox(width: 20,),
                  Text("Log Out",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}

