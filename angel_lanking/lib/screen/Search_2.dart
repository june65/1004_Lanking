import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/groupuser.dart';
import 'package:angel_lanking/widget/Profile.dart';
import 'package:flutter/material.dart';

class Search_2 extends StatefulWidget {
  const Search_2({super.key});

  @override
  State<Search_2> createState() => _Search_2State();
}

class _Search_2State extends State<Search_2> {
  late Future<List<GroupUserModel>>? grouplistmodel;

  @override
  void initState() {
    super.initState();
    grouplistmodel = ApiService.getGroupList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: '단체명 ex) 천사대학교',
            ),
          ),
        ),
        FutureBuilder(
            future: grouplistmodel,
            builder: ((context, donationSnapshot2) {
              if (donationSnapshot2.hasData) {
                return Column(
                  children: [
                    for (var group in donationSnapshot2.data!)
                      Profile(
                        name: group.name,
                        userlist: group.user,
                        image: group.image,
                        donationlist: group.donation,
                      ),
                  ],
                );
              } else {
                return Container();
              }
            })),
      ],
    );
  }
}
