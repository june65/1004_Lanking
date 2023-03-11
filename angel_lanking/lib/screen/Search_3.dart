import 'package:flutter/material.dart';

class Search_3 extends StatelessWidget {
  const Search_3({super.key});

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
              labelText: '유튜버 / 연예인 / 방송인',
            ),
          ),
        ),
        //Friend(cost: 800, total: 1000),
      ],
    );
  }
}
