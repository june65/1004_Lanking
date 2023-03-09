import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/widget/Profile_inner.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String name;
  final String image;
  final List userlist;
  final List donationlist;
  const Profile({
    super.key,
    required this.name,
    required this.userlist,
    required this.image,
    required this.donationlist,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<List<dynamic>>? donationpoint;
  late Future<List<DonationModel2>> getDonationdata;
  @override
  void initState() {
    super.initState();
    getDonationdata = ApiService.getDonationdata2(widget.donationlist);
  }

  static Future<dynamic> getDonationPointdata(
      List<DonationModel2> DonationPointList) async {
    late int Start = 0;
    late int Final = 0;
    late int Sum = 0;
    late double Persent = 0.0;

    for (int i = 0; i < DonationPointList.length; i++) {
      if (DonationPointList[i].delete) {
        if (DonationPointList[i].pass) {
          Sum += DonationPointList[i].money;
        }
      }
    }
    return Sum;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDonationdata,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Profile_inner(
              name: widget.name,
              userlist: widget.userlist,
              image: widget.image,
              donationlist: widget.donationlist,
              getDonationdata: snapshot.data!);
        }
        return Container();
      },
    );
  }
}
