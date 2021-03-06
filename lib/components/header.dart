import 'package:catho_app_food_truck/client/entity/User.dart';
import 'package:catho_app_food_truck/client/entity/session_Object.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

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
    User user = session.allItems.first;
    Size size = MediaQuery.of(context).size;
    return SliverList(
        delegate: SliverChildListDelegate(
      [
        Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: size.height / 5,
                  decoration: const BoxDecoration(
                      color: Colors.teal,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(45)),
                      boxShadow: [
                        BoxShadow(offset: Offset(0, 0), blurRadius: 2),
                      ]),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            child: Image.network(
                              session.getUrl(),
                              width: 100.0,
                              height: 100.0,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                               Text(
                                session.getName(),
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black54,
                                ),
                                child: Text(session.getFormation(),
                                    style: TextStyle(color: Colors.white70)),
                              ),
                            ],
                          ),
                          const Spacer(),
                           Text(session.getSolde().toString() + " ???",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
            Positioned(
              bottom: 0,
              child: SizedBox(
                height: 50,
                width: size.width,
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "What does you belly want to eat ?",
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.only(left: 20)),
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
