import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(45)),
      child: Container(
        color: Colors.black38,
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            children: const [
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
