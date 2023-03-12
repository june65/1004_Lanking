import 'package:angel_lanking/screen/Search_1.dart';
import 'package:angel_lanking/screen/Search_2.dart';
import 'package:angel_lanking/screen/Search_3.dart';
import 'package:angel_lanking/screen/Search_4.dart';
import 'package:flutter/material.dart';

class Home_3 extends StatefulWidget {
  final String userID, user_group;
  final int search_group;
  final int my_group;
  const Home_3({
    super.key,
    required this.search_group,
    required this.my_group,
    required this.userID,
    required this.user_group,
  });

  @override
  State<Home_3> createState() => _Home_3State();
}

class _Home_3State extends State<Home_3> {
  int _search_group = 1;
  @override
  void initState() {
    super.initState();
    _search_group = widget.search_group;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _search_group = 1;
                        });
                      },
                      child: _search_group == 1
                          ? Selected_button(button_text: widget.user_group)
                          : None_Selected_button(
                              button_text: widget.user_group),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _search_group = 2;
                        });
                      },
                      child: _search_group == 2
                          ? const Selected_button(button_text: '단체/회사')
                          : const None_Selected_button(button_text: '단체/회사'),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _search_group = 3;
                        });
                      },
                      child: _search_group == 3
                          ? const Selected_button(button_text: '전체랭킹')
                          : const None_Selected_button(button_text: '전체랭킹'),
                    ),
                    /*
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _search_group = 4;
                        });
                      },
                      child: _search_group == 4
                          ? const Selected_button(button_text: '기업')
                          : const None_Selected_button(button_text: '기업'),
                    ),
                    */
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            _search_group == 1
                ? Search_1(user_group: widget.user_group, userID: widget.userID)
                : Container(),
            _search_group == 2 ? const Search_2() : Container(),
            _search_group == 3 ? const Search_3() : Container(),
            _search_group == 4 ? const Search_4() : Container(),
          ],
        ),
      ],
    );
  }
}

class None_Selected_button extends StatelessWidget {
  final String button_text;

  const None_Selected_button({
    Key? key,
    required this.button_text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
        bottom: 5,
        right: 2,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: const Color(0xFFCCCCCC),
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Text(
            button_text,
            style: const TextStyle(
              color: Color(0xFFCCCCCC),
            ),
          ),
        ),
      ),
    );
  }
}

class Selected_button extends StatelessWidget {
  final String button_text;

  const Selected_button({
    Key? key,
    required this.button_text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
        bottom: 5,
        right: 2,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          child: Text(
            button_text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
