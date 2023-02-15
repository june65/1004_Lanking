import 'package:angel_lanking/widget/Banner.dart';
import 'package:angel_lanking/widget/Website.dart';
import 'package:flutter/cupertino.dart';

class Home_2 extends StatelessWidget {
  const Home_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner1.png',
          link:
              'https://www.unicef.or.kr/?trackcode=g_kad&utm_source=google&utm_medium=cpc&utm_term=%EC%9C%A0%EB%8B%88%EC%84%B8%ED%94%84&utm_campaign=brand&mac_ad_key=2011231204&gclid=CjwKCAiAuOieBhAIEiwAgjCvcpulhoe0KN_F6Ho3eb21KIsVIPw4xyEuyGb-F6_KtP8WmbvQveYFQBoCIyEQAvD_BwE',
        ),
        Banners(
          image:
              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/banner2.png',
          link:
              'https://www.childfund.or.kr/regularSpon/regular.do?utm_medium=cpc&utm_source=google&utm_campaign=g_search_pc&utm_content=&utm_term=%EC%96%B4%EB%A6%B0%EC%9D%B4%EC%9E%AC%EB%8B%A8&gclid=CjwKCAiAuOieBhAIEiwAgjCvchPLjHz30pKGLtNtR2HQclRkLAiC7TT4RYdHmo-fvsH7F4I0-30SqxoCaBYQAvD_BwE',
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
