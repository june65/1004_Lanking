import 'dart:io';

import 'package:angel_lanking/model/donation2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class Tier_image extends StatefulWidget {
  final String tier;
  final String userID;
  final List donationList;
  final List<DonationModel2> getDonationdata;

  const Tier_image({
    super.key,
    required this.userID,
    required this.tier,
    required this.donationList,
    required this.getDonationdata,
  });

  @override
  State<Tier_image> createState() => _Tier_imageState();
}

class _Tier_imageState extends State<Tier_image> {
  TextEditingController group_id = TextEditingController();

  String group = '';

  late String user_id;
  late String _imageUrl = '';
  @override
  void initState() {
    super.initState();
    String imageUrl = '';
    if (widget.tier == 'Bronze') {
      imageUrl =
          'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/002.png';
    }
    if (widget.tier == 'Silver') {
      imageUrl =
          'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/003.png';
    }
    if (widget.tier == 'Gold') {
      imageUrl =
          'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/004.png';
    }
    if (widget.tier == 'Platinum') {
      imageUrl =
          'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/005.png';
    }
    if (widget.tier == 'Diamond') {
      imageUrl =
          'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/006.png';
    }
    if (widget.tier == 'Master') {
      imageUrl =
          'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/001.png';
    }

    setState(() {
      _imageUrl = imageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share), // 검색 아이콘 생성
            onPressed: () async {
              try {
                final bytes = await NetworkAssetBundle(Uri.parse(_imageUrl))
                    .load(_imageUrl);
                final tempDir = await getTemporaryDirectory();
                final file = await File('${tempDir.path}/image.jpg').create();
                await file.writeAsBytes(bytes.buffer.asUint8List(),
                    flush: true);
                await Share.shareFiles([file.path],
                    text: 'Check out this image!');
              } catch (e) {
                print('Error sharing image: $e');
              }
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 12, 10, 10),
      body: SizedBox(
        height: double.infinity,
        child: Image.network(
          _imageUrl,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
