import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final IconData iconshape;
  final Color backgroundcolor;
  final Color textcolor;

  const Button({
    super.key,
    required this.text,
    required this.iconshape,
    required this.backgroundcolor,
    required this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconshape,
            color: textcolor,
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(text,
                style: TextStyle(
                  fontSize: 20,
                  color: textcolor,
                )),
          ),
        ],
      ),
    );
  }
}
