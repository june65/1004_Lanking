import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/groupuser.dart';
import 'package:angel_lanking/widget/FriendMain.dart';
import 'package:flutter/material.dart';

class Search_1 extends StatefulWidget {
  final String userID, user_group;
  const Search_1({super.key, required this.user_group, required this.userID});

  @override
  State<Search_1> createState() => _Search_1State();
}

class _Search_1State extends State<Search_1> {
  late Future<GroupUserModel>? groupusermodel;
  TextEditingController search_user_id = TextEditingController();
  /*
  검색기능
  bool show = true;
  void search_fuction() {
    if (search_user_id.text.length % 2 == 0) {
      bool show = false;
    } 
  }
  */
  @override
  void initState() {
    super.initState();
    groupusermodel = ApiService.getGroupUser(widget.user_group);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          
          child: TextField(
            controller: search_user_id,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: '아이디 ex) 1004_lanking',
            ),
            
            onChanged: (value) {
              setState(() {
                search_fuction();
              });
            },
            
          ),
        ),
        */
        FutureBuilder(
          future: groupusermodel,
          builder: ((context, groupSnapshot) {
            if (groupSnapshot.hasData) {
              return Column(
                children: [
                  for (var group in groupSnapshot.data!.user)
                    FriendMain(userID: group)
                ],
              );
            }
            return Container();
          }),
        ),
      ],
    );
  }
}
