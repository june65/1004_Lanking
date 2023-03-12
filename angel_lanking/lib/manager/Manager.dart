import 'package:angel_lanking/screen/Home_4.dart';
import 'package:flutter/material.dart';

class Manager extends StatefulWidget {
  const Manager({
    super.key,
  });

  @override
  State<Manager> createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 10, 10),
        centerTitle: true,
        title: const Text('관리자 페이지'),
      ),
      backgroundColor: const Color.fromARGB(255, 12, 10, 10),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: const my_page_button(
                text: '새로 등록된 기부 내역',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const my_page_button(
                text: '순위 정렬',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
