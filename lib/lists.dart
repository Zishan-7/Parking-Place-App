import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'description.dart';

class Hotels extends StatefulWidget {
  @override
  _HotelsState createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.of(context).size.width;
    var high = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.grey[850],
            title: Text("Parking Places Available at this location:",
                style: TextStyle(color: Colors.tealAccent[400]))),
        body: StreamBuilder<QuerySnapshot>(
          stream: db.collection("hotels").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    String price = ds['Price'].toString();
                    return Card(
                      child: Container(
                        height: high * 0.3,
                        width: widths,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: high * 0.27,
                              width: widths * 0.2,
                              color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Hotel(
                                            ds['name'],
                                            ds['Discription'],
                                            price,
                                            ds['images']),
                                      ));
                                },
                                child: Image.network(
                                  ds['image'],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              height: high * 0.27,
                              width: widths * 0.6,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(ds['name'],
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                  Text(ds['Discription'],
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              height: high * 0.27,
                              width: widths * 0.15,
                              child: Center(
                                child: Text(
                                  "Price: Rs $price",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Error retrieving events: ${snapshot.error.toString()}',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
