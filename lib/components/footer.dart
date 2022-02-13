import 'package:flutter/material.dart';

class Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
      child: Container(
        color: Colors.black38,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            children: [
              Spacer(),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.add_alert),
                color: Colors.white,
              ),
              Spacer(),
              Spacer(),
              IconButton(
                onPressed: null,
                icon: Icon(Icons.turned_in),
                color: Colors.white,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
