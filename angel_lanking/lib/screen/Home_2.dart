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
              'https://s3-alpha-sig.figma.com/img/193c/1c74/7ba0c7ab9652ef2a73a472fa92be27c5?Expires=1676246400&Signature=PhowIt~jW990RH~j07d-WR8351Dxk46HJVF5EyymdUo9JudtU~UyoJ0gyK6D6~YF2Oa3uAszGO2qDJFKxm7ZV0XpJik-cW~Pa73vO~2uLVFKZGk2Msy3iojJLtKPfLC8duX~-OF0Lj90LoRQ5sYlCE0X6SH0J6Sra7j4Hz~Uxmf6uMjttSdRlWXzBpgXob~Q3-x3BPBrcSVaRVRRGpeITdELCx1k0zYQRiEz~cJna7OiI9U9cZ8JDgu8MlfCTXGP3JMuovDK3r3lRWcrAJZMrDhnDV2oPSuEUiO9eJYfsdNu2vGnQTNQ5mAsmtYbUCVW3PBfWETcNt49QZWf6JnaAg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
          link:
              'https://www.unicef.or.kr/?trackcode=g_kad&utm_source=google&utm_medium=cpc&utm_term=%EC%9C%A0%EB%8B%88%EC%84%B8%ED%94%84&utm_campaign=brand&mac_ad_key=2011231204&gclid=CjwKCAiAuOieBhAIEiwAgjCvcpulhoe0KN_F6Ho3eb21KIsVIPw4xyEuyGb-F6_KtP8WmbvQveYFQBoCIyEQAvD_BwE',
        ),
        Banners(
          image:
              'https://s3-alpha-sig.figma.com/img/da90/e846/a7e1b1b8c9ad4b975803da1cd83f7bc5?Expires=1676246400&Signature=l6zl4t5KRDCyYMlEg7hIuUEgCRxW36vKe3RlqHAIc4S4q4ncNn1QV4ZRvWXCJntB7xViBJ4vYdTtDRhPFo1b4xXEYghzcO6I--OMU584Jp4~MxMm2zHAW2RXS3y-IRymlum4uPoO1H1weQxsjeTnkPX0MLDjPL~hCQ9eFY~UJ~dsm18Ut81CADG3DU~EV3okanjv1MByeGLbVuMW~10kcTxGP3l7YUEA1QqGOW2xuYkkMhIV9xe~HzmGznsOPDOaghPwcgPqjYMwj-dnqAQaOdYzeZsHAEEebE6UkPx8IkJQPodpKS6FbZ-gSU5Aq0pcmuITMVrcI03YmgcKNb8h6Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
          link:
              'https://www.childfund.or.kr/regularSpon/regular.do?utm_medium=cpc&utm_source=google&utm_campaign=g_search_pc&utm_content=&utm_term=%EC%96%B4%EB%A6%B0%EC%9D%B4%EC%9E%AC%EB%8B%A8&gclid=CjwKCAiAuOieBhAIEiwAgjCvchPLjHz30pKGLtNtR2HQclRkLAiC7TT4RYdHmo-fvsH7F4I0-30SqxoCaBYQAvD_BwE',
        ),
        Banners(
          image:
              'https://s3-alpha-sig.figma.com/img/21bf/9f96/18c24256bd689a0df35aa2e64413c1e7?Expires=1676246400&Signature=Idti2ViK15vTDvm~9OTkFyZ7Vg4ivdLaqEFT0s1wInvmchWXcImbzjpNnVxrYvTue3NdZEut3x9lR8SDG7LfbXJZE~J7-OodDoahJAe3XUQ2le7IN3oE7UlJxtZizel-nLa2uH-Dpwxu2mjMU6g2U-ia17YAgciPOSgSza4qpMTiZ4o2OT1GasbyCTIma61kEpPxH0PAqu1~HDC4BdkMYA00Na-X-1L7v0UK~fSFn6rpAhDP5e9Y1du6XIhiL8V3b~djaaF-KdNl0ma8UaAcZBnBov-BtKlvzykBuN11pppVRS-0wK~DX-92e1-QkXgivUR~e7KBJ9QAUTY3c46QEQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
          link: 'https://chest.or.kr/base.do',
        ),
        Website(),
      ],
    );
  }
}