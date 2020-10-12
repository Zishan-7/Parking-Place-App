import 'package:flutter/material.dart';

String name, discription, price;
List images;

class Hotel extends StatefulWidget {
  @override
  _HotelState createState() => _HotelState();

  Hotel(String names, String discriptions, String prices, List image) {
    name = names;
    discription = discriptions;
    price = prices;
    images = image;
  }
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    var widths = MediaQuery.of(context).size.width;
    var heights = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "Website Name",
            style: TextStyle(fontSize: 30, color: Colors.tealAccent[400]),
          ),
        ),
        bottom:
            PreferredSize(child: Container(), preferredSize: Size(widths, 20)),
      ),
      body: ListView(children: [
        Column(
          children: [
            Center(
              child: Container(
                  alignment: Alignment.center,
                  width: widths,
                  height: heights * 0.6,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Image.network(
                            images[index],
                            fit: BoxFit.fill,
                          ),
                        );
                      })),
            ),
            Container(
              color: Colors.white,
              width: widths,
              child: Row(
                children: [
                  Container(
                      width: widths * 0.7,
                      height: heights,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Text(
                                "$name                                                                                                     ",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Description                                                                                                                                                      ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              discription,
                              // "The Jianguo Hotel Qianmen is located near Tiantan Park, just a 10-minute walk from the National Center for the Performing Arts and Tian'anmen Square. Built in 1956 it has old school charm and many rooms still feature high, crown-molded ceilings. A 2012 renovation brought all rooms and services up to modern day scratch and guestrooms come equipped with free Wi-Fi and all the usual amenities required for a comfortable stay.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Location                                                                                                                                                              ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Taiwan (Chinese: 臺灣/台灣; pinyin: Táiwān),[II] officially the Republic of China (ROC),[I][f] is a country in East Asia.[16][17] Neighbouring countries include the People's Republic of China (PRC) to the northwest, Japan to the northeast, and the Philippines to the south. The main island of Taiwan has an area of 35,808 square kilometres (13,826 sq mi), with mountain ranges dominating the eastern two-thirds and plains in the western third, where its highly urbanised population is concentrated. Taipei is the capital as well as the largest metropolitan area of Taiwan. Other major cities include New Taipei, Kaohsiung, Taichung, Tainan and Taoyuan. With 23.7 million inhabitants",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )),
                  Card(
                    shadowColor: Colors.black,
                    elevation: 15,
                    child: Container(
                      width: widths * 0.27,
                      height: heights * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "PRICE: Rs. $price",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Date and time for booking",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Room Specifications",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.greenAccent[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            padding: EdgeInsets.only(
                                left: 50, right: 50, top: 25, bottom: 25),
                            child: Text("Continue to book",
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
