import 'package:angel_lanking/model/donation2.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Tier_image extends StatelessWidget {
  final String tier;
  final String userID;
  final List donationList;
  final List<DonationModel2> getDonationdata;

  Tier_image({
    super.key,
    required this.userID,
    required this.tier,
    required this.donationList,
    required this.getDonationdata,
  });

  TextEditingController group_id = TextEditingController();

  String group = '';

  late String user_id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 10, 10),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share), // 검색 아이콘 생성
            onPressed: () async {
              const urlPreview =
                  'https://s3-alpha-sig.figma.com/img/3296/26e9/751c7e7f277d3be9936d8a764ce3ce3d?Expires=1678665600&Signature=nCaaMkoxrruuGrV7q989FgzGLMrZIBL84rgQzSQ1UZFTzMEhk2mpH0WQTp5jeSelVz3b6jcMt7qUGIv8y5NCI-c6ihS6QGBSupoFInDylpsWUIR6RT6Pm7LmXJIJPz-Izc~-urJcO0dYyx86QtmsKgMlx29pi3vhPCOmKEpDrDr4EoUsEw6eBfcGTmZFaWsdCJW1Ojp3huaOfNxBIp7Vlk2cTj8Vj0JIQIqnImK2ax3ffcOnFuWOoKeU28o2P8lfGRrsQ82jiVxF~lzITvZqGrLsCq5VQcXImqLelK4Q7WY4828b0rNNXgO2Ee8SedqugViy1EGnJnsvTBdx6tM5tg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4';

              //final url = Uri.parse(urlPreview);
              //final response = await http.get(url);
              //final bytes = response.bodyBytes;

              await Share.share('$tier 티어상승!');
            },
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 12, 10, 10),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.network(
              'https://s3-alpha-sig.figma.com/img/3296/26e9/751c7e7f277d3be9936d8a764ce3ce3d?Expires=1678665600&Signature=nCaaMkoxrruuGrV7q989FgzGLMrZIBL84rgQzSQ1UZFTzMEhk2mpH0WQTp5jeSelVz3b6jcMt7qUGIv8y5NCI-c6ihS6QGBSupoFInDylpsWUIR6RT6Pm7LmXJIJPz-Izc~-urJcO0dYyx86QtmsKgMlx29pi3vhPCOmKEpDrDr4EoUsEw6eBfcGTmZFaWsdCJW1Ojp3huaOfNxBIp7Vlk2cTj8Vj0JIQIqnImK2ax3ffcOnFuWOoKeU28o2P8lfGRrsQ82jiVxF~lzITvZqGrLsCq5VQcXImqLelK4Q7WY4828b0rNNXgO2Ee8SedqugViy1EGnJnsvTBdx6tM5tg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4',
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }
}
