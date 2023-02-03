import 'package:angel_lanking/widget/Profile.dart';
import 'package:flutter/material.dart';

class Search_4 extends StatelessWidget {
  const Search_4({super.key});

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
              labelText: '기업명 ex) (주)천사랭킹',
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
