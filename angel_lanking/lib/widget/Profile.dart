import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/widget/Profile_inner.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String name;
  final String image;
  final int index;
  final int money;
  final List userlist;
  final List donationlist;
  const Profile({
    super.key,
    required this.name,
    required this.userlist,
    required this.image,
    required this.donationlist,
    required this.index,
    required this.money,
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
            getDonationdata: snapshot.data!,
            index: widget.index,
            money: widget.money,
          );
        }
        return Container();
      },
    );
  }
}
