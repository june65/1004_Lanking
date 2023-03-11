import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/widget/FriendHome.dart';
import 'package:flutter/material.dart';

class FriendMain extends StatefulWidget {
  final String userID;

  const FriendMain({
    super.key,
    required this.userID,
  });

  @override
  State<FriendMain> createState() => _FriendMainState();
}

class _FriendMainState extends State<FriendMain> {
  late Future<UserModel>? usermodel;
  @override
  void initState() {
    super.initState();
    usermodel = ApiService.getUserdata(widget.userID);
    //initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: usermodel,
        builder: ((context, userSnapshot) {
          if (userSnapshot.hasData) {
            return FriendHome(
                userID: widget.userID,
                user_group: userSnapshot.data!.group,
                donationList: userSnapshot.data!.donation);
          } else {
            return Container();
          }
        }));
  }
}
