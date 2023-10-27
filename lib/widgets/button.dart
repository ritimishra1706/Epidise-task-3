import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  // final String label;
  //final Function onTap;
  const Button({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        //onTap: () => onTap,
        child: Container(
            width: 100,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 31, 227, 208),
            ),
            child: Text(
              "hello",
              style: TextStyle(
                color: Colors.white,
              ),
            )));
  }
}
