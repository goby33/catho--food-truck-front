import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final String categorie;
  Categories(this.categorie);
  @override
  _CategoriesState createState() {
    return _CategoriesState();
  }
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int currentSelectedItem = 0;
  List<String> listText = ['Menus','Plats','Boissons', 'Dessert'];
  List<IconData> listIcons = [Icons.fastfood,Icons.airplane_ticket,Icons.face_retouching_natural,Icons.pages];
  @override
  Widget build(BuildContext context) {
    int items = 100;
    // TODO: implement build
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listText.length,
          itemBuilder: (context, index) => Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    margin:
                        EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          currentSelectedItem = index;
                          setState(() {
                          });
                        });
                      },
                      child: Card(
                        color: index == currentSelectedItem ?   Colors.black.withOpacity(0.7) : Colors.white,
                        child: Icon(
                          listIcons[index],
                          color: index == currentSelectedItem ?  Colors.white: Colors.black.withOpacity(0.7),
                        ),
                        elevation: 3,
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? 20 : 0,
                    right: 20,
                  ),
                  width: 90,
                  child: Row(
                    children: [
                      Spacer(),
                      Text(listText[index]),
                      Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
