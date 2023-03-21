import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/widget/Friend.dart';
import 'package:flutter/material.dart';

class FriendHome_1 extends StatefulWidget {
  final String user_group;
  final String userID;
  final int used_money;
  final List donationList;
  final List<DonationModel2> getDonationdata;
  const FriendHome_1({
    super.key,
    required this.userID,
    required this.used_money,
    required this.user_group,
    required this.getDonationdata,
    required this.donationList,
  });

  @override
  State<FriendHome_1> createState() => _FriendHome_1State();
}

class _FriendHome_1State extends State<FriendHome_1> {
  late Future<UserModel>? usermodel;
  //late Future<List<DonationModel>> getDonationdata2;
  late Future<List<dynamic>>? donationpoint;
  @override
  void initState() {
    super.initState();
    usermodel = ApiService.getUserdata(widget.userID);
    donationpoint = ApiService.getDonationPointdata(
      widget.getDonationdata,
      widget.used_money,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: usermodel,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
                future: donationpoint,
                builder: (context, snapshotpoint) {
                  if (snapshotpoint.hasData) {
                    return Friend(
                      name: snapshot.data!.name,
                      group: snapshot.data!.group,
                      lank: snapshotpoint.data![1],
                      point: 0,
                      cost: snapshotpoint.data![0],
                      end: snapshotpoint.data![3],
                      start: snapshotpoint.data![2],
                      userID: widget.userID,
                      donationList: widget.donationList,
                      persent: snapshotpoint.data![4],
                      getDonationdata: widget.getDonationdata,
                    );
                  }
                  return Friend(
                    name: '...',
                    group: '...',
                    lank: '...',
                    point: 0,
                    cost: 1000,
                    end: 2000,
                    start: 0,
                    userID: widget.userID,
                    donationList: widget.donationList,
                    persent: 0,
                    getDonationdata: widget.getDonationdata,
                  );
                });
          }
          return Friend(
            name: '...',
            group: '...',
            lank: '...',
            point: 0,
            cost: 1000,
            end: 2000,
            start: 0,
            userID: widget.userID,
            donationList: widget.donationList,
            persent: 0,
            getDonationdata: widget.getDonationdata,
          );
        }));
  }
}
