import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/widget/FriendHome1.dart';
import 'package:flutter/material.dart';

class FriendHome extends StatefulWidget {
  final String user_group;
  final String userID;
  final List donationList;
  const FriendHome({
    super.key,
    required this.userID,
    required this.user_group,
    required this.donationList,
  });

  @override
  State<FriendHome> createState() => _FriendHomeState();
}

class _FriendHomeState extends State<FriendHome> {
  late Future<List<DonationModel2>> getDonationdata;
  @override
  void initState() {
    super.initState();
    getDonationdata = ApiService.getDonationdata2(widget.donationList);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDonationdata,
        builder: ((context, Snapshot) {
          if (Snapshot.hasData) {
            return FriendHome_1(
              userID: widget.userID,
              user_group: widget.user_group,
              getDonationdata: Snapshot.data!,
              donationList: widget.donationList,
            );
          } else {
            return Container();
          }
        }));
  }
}
