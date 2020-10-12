import 'package:flutter/material.dart';
import 'package:hotel_booking/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_booking/login.dart';
import 'package:hotel_booking/testmaps.dart';

class Home extends StatefulWidget {
  final String uid;

  Home({Key key, @required this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState(uid);
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;
  final String uid;
  _HomeState(this.uid);

  var taskcollections = FirebaseFirestore.instance.collection('Users');
  String task;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          "Website Name",
          style: TextStyle(fontSize: 30, color: Colors.tealAccent[400]),
        ),
        actions: [
          RaisedButton(
            onPressed: () => signOutUser().then((value) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Login()),
                  (Route<dynamic> route) => false);
            }),
            child: Text("SIGN OUT"),
          )
        ],
        bottom: PreferredSize(child: Container(), preferredSize: Size(w, 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: h,
            width: w * 0.666,
            child: Test(),
          ),
        ),
      ),
    );
  }
}
