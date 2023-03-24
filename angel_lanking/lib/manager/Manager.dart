import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/manager/ManagerTestUser.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/model/groupuser.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/screen/Home_4.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Manager extends StatefulWidget {
  const Manager({
    super.key,
  });

  @override
  State<Manager> createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  late Future<GroupUserModel>? groupGISTusermodel;
  late Future<GroupUserModel>? groupKAISTusermodel;

  @override
  void initState() {
    super.initState();
    groupGISTusermodel = ApiService.getGroupUser('GIST');
    groupKAISTusermodel = ApiService.getGroupUser('KAIST');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 10, 10),
        centerTitle: true,
        title: const Text('관리자 페이지'),
      ),
      backgroundColor: const Color.fromARGB(255, 12, 10, 10),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: const my_page_button(
                text: '새로 등록된 기부 내역',
              ),
            ),
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
                                      List GISTuserlist =
                                          GISTsnapshot.data!.user;

                                      var GISTMoneylist = [];

                                      for (var GISTuser in GISTuserlist) {
                                        var result = await FirebaseFirestore
                                            .instance
                                            .collection('user')
                                            .doc(GISTuser)
                                            .get();

                                        final UserDetail =
                                            UserModel.fromJson(result.data());
                                        int SumUser = 0;
                                        for (var Donation
                                            in UserDetail.donation) {
                                          var result2 = await FirebaseFirestore
                                              .instance
                                              .collection('donation_list')
                                              .doc(Donation)
                                              .get();

                                          final DonationData =
                                              DonationModel2.fromJson(
                                                  result2.data());

                                          SumUser += DonationData.money;
                                        }
                                        SumUser += UserDetail.used_money;
                                        String tier;
                                        if (SumUser < 30000) {
                                          tier = 'Bronze';
                                        } else if (SumUser < 100000) {
                                          tier = 'Silver';
                                        } else if (SumUser < 200000) {
                                          tier = 'Gold';
                                        } else if (SumUser < 500000) {
                                          tier = 'Platinum';
                                        } else if (SumUser < 1000000) {
                                          tier = 'Diamond';
                                        } else {
                                          tier = 'Master';
                                        }

                                        await FirebaseFirestore.instance
                                            .collection('user')
                                            .doc(GISTuserlist[
                                                GISTuserlist.indexOf(GISTuser)])
                                            .update({
                                          'tier': tier,
                                        });
                                        GISTMoneylist.add(SumUser);
                                      }
                                      for (var i = 1;
                                          i < GISTMoneylist.length;
                                          i++) {
                                        var cur = GISTMoneylist[i];
                                        var cur2 = GISTuserlist[i];
                                        var left = i - 1;

                                        while (left >= 0 &&
                                            GISTMoneylist[left] < cur) {
                                          GISTMoneylist[left + 1] =
                                              GISTMoneylist[left];
                                          GISTuserlist[left + 1] =
                                              GISTuserlist[left];
                                          GISTMoneylist[left] = cur;
                                          GISTuserlist[left] = cur2;
                                          cur = GISTMoneylist[left];
                                          cur2 = GISTuserlist[left];
                                          left--;
                                        }
                                      }

                                      List KAISTuserlist =
                                          KAISTsnapshot.data!.user;
                                      var KAISTMoneylist = [];
                                      for (var KAISTuser in KAISTuserlist) {
                                        var result = await FirebaseFirestore
                                            .instance
                                            .collection('user')
                                            .doc(KAISTuser)
                                            .get();

                                        final UserDetail =
                                            UserModel.fromJson(result.data());
                                        int SumUser = 0;
                                        for (var Donation
                                            in UserDetail.donation) {
                                          var result2 = await FirebaseFirestore
                                              .instance
                                              .collection('donation_list')
                                              .doc(Donation)
                                              .get();

                                          final DonationData =
                                              DonationModel2.fromJson(
                                                  result2.data());

                                          SumUser += DonationData.money;
                                        }
                                        SumUser += UserDetail.used_money;
                                        String tier;
                                        if (SumUser < 30000) {
                                          tier = 'Bronze';
                                        } else if (SumUser < 100000) {
                                          tier = 'Silver';
                                        } else if (SumUser < 200000) {
                                          tier = 'Gold';
                                        } else if (SumUser < 500000) {
                                          tier = 'Platinum';
                                        } else if (SumUser < 1000000) {
                                          tier = 'Diamond';
                                        } else {
                                          tier = 'Master';
                                        }

                                        await FirebaseFirestore.instance
                                            .collection('user')
                                            .doc(KAISTuserlist[
                                                KAISTuserlist.indexOf(
                                                    KAISTuser)])
                                            .update({
                                          'tier': tier,
                                        });
                                        KAISTMoneylist.add(SumUser);
                                      }
                                      for (var i = 1;
                                          i < KAISTMoneylist.length;
                                          i++) {
                                        var cur = KAISTMoneylist[i];
                                        var cur2 = KAISTuserlist[i];
                                        var left = i - 1;

                                        while (left >= 0 &&
                                            KAISTMoneylist[left] < cur) {
                                          KAISTMoneylist[left + 1] =
                                              KAISTMoneylist[left];
                                          KAISTuserlist[left + 1] =
                                              KAISTuserlist[left];
                                          KAISTMoneylist[left] = cur;
                                          KAISTuserlist[left] = cur2;
                                          cur = KAISTMoneylist[left];
                                          cur2 = KAISTuserlist[left];
                                          left--;
                                        }
                                      }
                                      print(GISTuserlist);
                                      print(KAISTuserlist);
                                      await FirebaseFirestore.instance
                                          .collection('group')
                                          .doc('GIST')
                                          .update({
                                        'user': GISTuserlist,
                                      });
                                      await FirebaseFirestore.instance
                                          .collection('group')
                                          .doc('KAIST')
                                          .update({
                                        'user': KAISTuserlist,
                                      });
                                    },
                                    child: const my_page_button(
                                      text: '순위 정렬',
                                    ),
                                  )
                                : Container();
                          })
                      : Container();
                }),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((BuildContext context) =>
                        const ManagerTestUser()),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const my_page_button(
                text: '유저 업데이트',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
