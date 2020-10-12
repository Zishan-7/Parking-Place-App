// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

import 'description.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: {
          Marker(
            GeoCoord(31.341200, 76.763100),
            onTap: (id) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      content: Container(
                          height: 400,
                          width: 500,
                          color: Colors.white,
                          child:
                              /* Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child:
                                  Text("All The parkings available nearby: "),
                            ),*/
                              StreamBuilder<QuerySnapshot>(
                                  stream: db.collection("hotels").snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasData) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data.docs.length,
                                          itemBuilder: (context, index) {
                                            DocumentSnapshot ds =
                                                snapshot.data.docs[index];
                                            String name = ds['name'];
                                            String price =
                                                ds['Price'].toString();
                                            return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                height: 110,
                                                width: 500,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 120,
                                                      child: Image.network(
                                                          ds['image'],
                                                          fit: BoxFit.fill),
                                                    ),
                                                    Text(
                                                        "$name  Price: Rs. $price"),
                                                    RaisedButton(
                                                      onPressed: () {
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
                                                      color: Colors.blue,
                                                      child: Text("Book Now!!"),
                                                    )
                                                  ],
                                                ));
                                          });
                                    } else {
                                      return Center(
                                        child: Container(
                                            height: 50,
                                            width: 50,
                                            child: CircularProgressIndicator()),
                                      );
                                    }
                                  }))));
            },
          ),
        },
        initialPosition: GeoCoord(31.341200, 76.763100),
        mapType: MapType.roadmap,
        webPreferences: WebMapPreferences(zoomControl: true),
      ),
    );
  }
}
