import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/widget/Friend.dart';
import 'package:flutter/material.dart';

class FriendHome_1 extends StatefulWidget {
  final String user_group;
  final String userID;
  final List donationList;
  final List<DonationModel2> getDonationdata;
  const FriendHome_1({
    super.key,
    required this.userID,
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
    donationpoint = getDonationPointdata(widget.getDonationdata);
  }

  static Future<List<dynamic>> getDonationPointdata(
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

    late String tear = 'unranked';

    if (Sum < 30000) {
      tear = 'Bronze';
      Final = 30000;
      Persent = 92.1;
    } else if (Sum < 100000) {
      tear = 'Silver';
      Start = 30000;
      Final = 100000;
      Persent = 71.3;
    } else if (Sum < 200000) {
      tear = 'Gold';
      Start = 100000;
      Final = 200000;
      Persent = 40.7;
    } else if (Sum < 500000) {
      tear = 'Platinum';
      Start = 200000;
      Final = 500000;
      Persent = 10.7;
    } else if (Sum < 1000000) {
      tear = 'Diamond';
      Start = 500000;
      Final = 1000000;
      Persent = 5.7;
    } else {
      tear = 'Master';
      Start = 1000000;
      Final = 1000000;
      Persent = 1.7;
    }
    return [Sum, tear, Start, Final, Persent];
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
