import 'package:angel_lanking/widget/Banner.dart';
import 'package:angel_lanking/widget/Website.dart';
import 'package:flutter/cupertino.dart';

class Home_2 extends StatefulWidget {
  final int my_group;
  const Home_2({
    super.key,
    required this.my_group,
  });

  @override
  State<Home_2> createState() => _Home_2State();
}

class _Home_2State extends State<Home_2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner1.png',
          link: 'https://www.unicef.or.kr/',
        ),
        Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner2.png',
          link: 'https://www.childfund.or.kr/regularSpon/regular.do',
        ),
        Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner3.png',
          link: 'https://chest.or.kr/base.do',
        ),
        Website(),
      ],
    );
  }
}
