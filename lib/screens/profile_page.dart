import 'package:Medwise/screens/auth_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  String uid;
  ProfilePage(this.uid);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username, email, phone;
  getUserInfo() async {
    Firestore.instance
        .collection('users')
        .document(widget.uid)
        .get()
        .then((value) {
      setState(() {
        username = value.data["name"];
        email = value.data["email"];
        phone = value.data["phone_number"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserInfo();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'PROFILE',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: Color(0xfff6f6f9),
      body: username == null || phone == null || email == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: MediaQuery.of(context).size.height * .85,
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Color.fromRGBO(67, 67, 67, 1),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      color: Colors.white,
                      child: ListTile(
                        leading: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        title: Text(
                          username,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.phone, color: Colors.black),
                        title: Text(
                          phone,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(Icons.email, color: Colors.black87),
                        title: Text(
                          email,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut().whenComplete(() {
                          Navigator.pop(context);
                        });
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // padding: EdgeInsets.only(top: 50),
                              child: FlatButton(
                                color: Color.fromRGBO(67, 67, 67, 1),
                                height: 50,
                                child: Text(
                                  'Support',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              child: FlatButton(
                                color: Color.fromRGBO(67, 67, 67, 1),
                                height: 50,
                                child: Text(
                                  'Feedback',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
