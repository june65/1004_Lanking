import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/groupuser.dart';
import 'package:angel_lanking/screen/Home_4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ManagerTestUser extends StatefulWidget {
  const ManagerTestUser({
    super.key,
  });

  @override
  State<ManagerTestUser> createState() => _ManagerTestUserState();
}

class _ManagerTestUserState extends State<ManagerTestUser> {
  late Future<GroupUserModel>? groupGISTusermodel;
  late Future<GroupUserModel>? groupKAISTusermodel;

  @override
  void initState() {
    super.initState();
    groupGISTusermodel = ApiService.getGroupUser('GIST');
    groupKAISTusermodel = ApiService.getGroupUser('KAIST');
    _loadCSV('assets/data/testuser.csv');
  }

  late List<List<dynamic>> _data = [];

  void _loadCSV(path) async {
    final rawData = await rootBundle.loadString(path);
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    setState(() {
      _data = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 10, 10),
        centerTitle: true,
        title: const Text('유저 업데이트'),
      ),
      backgroundColor: const Color.fromARGB(255, 12, 10, 10),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FutureBuilder(
                future: groupGISTusermodel,
                builder: (context, GISTsnapshot) {
                  return GISTsnapshot.hasData
                      ? FutureBuilder(
                          future: groupKAISTusermodel,
                          builder: (context, KAISTsnapshot) {
                            return KAISTsnapshot.hasData
                                ? GestureDetector(
                                    onTap: () async {
                                      int i = 1;

                                      List GISTuserlist =
                                          GISTsnapshot.data!.user;
                                      List KAISTuserlist =
                                          KAISTsnapshot.data!.user;

                                      for (var data in _data) {
                                        await FirebaseFirestore.instance
                                            .collection('user')
                                            .doc('test$i')
                                            .set({
                                          'name': data[0],
                                          'donation': [],
                                          'instagram': data[2],
                                          'group': data[1],
                                          'money': data[3],
                                          'used_money': data[5],
                                          'tier': data[4],
                                        });

                                        if (data[1] == 'GIST') {
                                          GISTuserlist.add('test$i');
                                        }
                                        if (data[1] == 'KAIST') {
                                          KAISTuserlist.add('test$i');
                                        }

                                        i = i + 1;
                                      }
                                      /*
                                      await FirebaseFirestore.instance
                                          .collection('group')
                                          .doc('GIST')
                                          .update({'user': GISTuserlist});

                                      await FirebaseFirestore.instance
                                          .collection('group')
                                          .doc('KAIST')
                                          .update({'user': KAISTuserlist});
                                          */
                                    },
                                    child: const my_page_button(
                                      text: '업데이트 하기',
                                    ),
                                  )
                                : Container();
                          })
                      : Container();
                }),
          ],
        ),
      ),
    );
  }
}
