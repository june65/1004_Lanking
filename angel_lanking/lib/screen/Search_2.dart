import 'package:angel_lanking/widget/Profile.dart';
import 'package:flutter/material.dart';

class Search_2 extends StatelessWidget {
  const Search_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: '단체명 ex) 천사대학교',
            ),
          ),
        ),
        Profile(),
        Profile(),
        Profile(),
        Profile(),
        Profile(),
      ],
    );
  }
}
