import 'dart:ui';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {

  @override
  _HeaderState createState() {
    return _HeaderState();
  }
}

class _HeaderState extends State<Header> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // TODO: implement build
    return SliverList(
        delegate: SliverChildListDelegate(
      [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: size.height / 5,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(45)),
                      boxShadow: [
                        BoxShadow(offset: Offset(0, 0), blurRadius: 2),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white70,
                            radius: 35,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("images/pexels-pixabay-34534.png"),
                              radius: 30,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                "Paul Carton",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black54,
                                ),
                                child: Text("Master Cyber",
                                    style: TextStyle(color: Colors.white70)),
                              ),
                            ],
                          ),
                          Spacer(),
                          Text("14 €",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                width: size.width,
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: "What does you belly want to eat ?",
                      suffixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.only(left: 20)
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
