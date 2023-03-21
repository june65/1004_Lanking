import 'dart:io';
import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/model/donation_type.dart';
import 'package:angel_lanking/model/groupuser.dart';
import 'package:angel_lanking/model/number.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/screen/Coin_donation.dart';
import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/screen/Home_3.dart';
import 'package:angel_lanking/widget/Button.dart';
import 'package:angel_lanking/widget/Graph.dart';
import 'package:angel_lanking/widget/Lanking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Home_4 extends StatefulWidget {
  final String userID, user_group;
  final List donationList;
  final int my_group;
  final int used_money;
  final List<DonationModel2> getDonationdata;
  const Home_4(
      {super.key,
      required this.userID,
      required this.donationList,
      required this.my_group,
      required this.used_money,
      required this.getDonationdata,
      required this.user_group});

  @override
  State<Home_4> createState() => _Home_4State();
}

class _Home_4State extends State<Home_4> {
  late Future<UserModel>? usermodel;
  late Future<List<num>>? donationGroupList;
  late Future<DonationTypeModel>? donationtype;
  late Future<DonationnumberModel>? donationnumber;
  late List<dynamic> newdonationList;
  late Future<List<DonationModel2>> getDonationdata2;
  late Future<List<dynamic>>? donationpoint;
  late Future<GroupUserModel>? groupusermodel;

  TextEditingController title = TextEditingController();
  TextEditingController detail = TextEditingController();
  TextEditingController money = TextEditingController();

  List<String> dropdownList = [
    '사회복지',
    '의료',
    '해외 구호활동',
    '지역사회 발전',
    '교육 및 연구활동',
    '공익활동',
    '문화 및 예술 ',
    '기타'
  ];
  String selectedDropdown = '사회복지';
  int my_group_ = 0;
  bool loading = true;

  XFile? image;
  String imageUrl = '';

  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    XFile? img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  final now = DateTime.now();

  var image_exist = 0;
  Color button_color = Colors.grey;

  void donation_fuction() {
    if (title.text.isNotEmpty &&
        detail.text.isNotEmpty &&
        image_exist != 0 &&
        money.text.isNotEmpty) {
      button_color = Colors.black;
    } else {
      button_color = Colors.grey;
    }
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('이미지를 어디서 가져올까요?'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.image),
                        SizedBox(
                          width: 10,
                        ),
                        Text('갤러리'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.camera),
                        SizedBox(
                          width: 10,
                        ),
                        Text('카메라'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    my_group_ = widget.my_group;
    usermodel = ApiService.getUserdata(widget.userID);
    donationGroupList = getDonationGroupdata(widget.getDonationdata);
    donationtype = ApiService.getDonationtype();
    donationnumber = ApiService.getDonationnumber();
    getDonationdata2 = ApiService.getDonationdata2(widget.donationList);
    donation_fuction();
    newdonationList = widget.donationList;
    donationpoint = ApiService.getDonationPointdata(
        widget.getDonationdata, widget.used_money);
    groupusermodel = ApiService.getGroupUser(widget.user_group);
  }

  static Future<List<num>> getDonationGroupdata(List DonationGroupList) async {
    List<num> listGroupdonation = [0, 0, 0, 0, 0, 0, 0, 0];

    for (int i = 0; i < DonationGroupList.length; i++) {
      if (DonationGroupList[i].delete) {
        if (DonationGroupList[i].pass) {
          if (DonationGroupList[i].group == '사회복지') {
            listGroupdonation[0] += DonationGroupList[i].money;
          }
          if (DonationGroupList[i].group == '의료') {
            listGroupdonation[1] += DonationGroupList[i].money;
          }
          if (DonationGroupList[i].group == '해외 구호활동') {
            listGroupdonation[2] += DonationGroupList[i].money;
          }
          if (DonationGroupList[i].group == '지역사회 발전') {
            listGroupdonation[3] += DonationGroupList[i].money;
          }
          if (DonationGroupList[i].group == '교육 및 연구활동') {
            listGroupdonation[4] += DonationGroupList[i].money;
          }
          if (DonationGroupList[i].group == '공익활동') {
            listGroupdonation[5] += DonationGroupList[i].money;
          }
          if (DonationGroupList[i].group == '문화 및 예술') {
            listGroupdonation[6] += DonationGroupList[i].money;
          }
          if (DonationGroupList[i].group == '기타') {
            listGroupdonation[7] += DonationGroupList[i].money;
          }
        }
      }
    }
    return listGroupdonation;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        my_group_ == 0
            ? Column(
                children: [
                  FutureBuilder(
                      future: usermodel,
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return FutureBuilder(
                              future: donationpoint,
                              builder: (context, snapshotpoint) {
                                if (snapshotpoint.hasData) {
                                  return Lanking(
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
                                    my_group: widget.my_group,
                                  );
                                }
                                return Lanking(
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
                                  my_group: widget.my_group,
                                );
                              });
                        }
                        return Lanking(
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
                          my_group: widget.my_group,
                        );
                      })),
                  FutureBuilder(
                    future: usermodel,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                    Coin_donation(
                                      userID: widget.userID,
                                      money: snapshot.data!.money,
                                      used_money: snapshot.data!.used_money,
                                      user_group: widget.user_group,
                                      donationList: widget.donationList,
                                    )),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 5),
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFF0047FF),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/Group+55+(1).png',
                                            width: 80,
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                '천사 머니',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                '${ApiService.money_f.format(snapshot.data!.money)}원',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.chevron_right,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                  FutureBuilder(
                    future: donationGroupList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Graph(donationGroupList: snapshot.data!);
                      }
                      return Container();
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        my_group_ = 2;
                      });
                    },
                    child: const my_page_button(
                      text: '등록하기',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        my_group_ = 1;
                      });
                    },
                    child: const my_page_button(
                      text: '등록 기부내역',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        my_group_ = 3;
                      });
                    },
                    child: const my_page_button(
                      text: '인증된 기부내역',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const my_page_button(
                      text: '회원정보',
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      FirebaseAuth.instance.signOut();
                    },
                    child: const my_page_button(
                      text: '로그아웃',
                    ),
                  ),
                ],
              )
            : Container(),
        my_group_ == 1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((BuildContext context) => Home(
                                page: 3,
                                search_group: 1,
                                userID: widget.userID,
                                donationList: widget.donationList,
                                my_group: 0,
                                user_group: widget.user_group,
                              )),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text(
                        '< 마이페이지',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF3B3B3B)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 2;
                            });
                          },
                          child: my_group_ == 2
                              ? const Selected_button(button_text: '등록하기')
                              : const None_Selected_button(button_text: '등록하기'),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 1;
                            });
                          },
                          child: my_group_ == 1
                              ? const Selected_button(button_text: '등록 내역')
                              : const None_Selected_button(
                                  button_text: '등록 내역'),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 3;
                            });
                          },
                          child: my_group_ == 3
                              ? const Selected_button(button_text: '인증 내역')
                              : const None_Selected_button(
                                  button_text: '인증 내역'),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                      future: getDonationdata2,
                      builder: ((context, donationSnapshot2) {
                        if (donationSnapshot2.hasData) {
                          return Column(
                            children: [
                              for (var donation in donationSnapshot2.data!)
                                if (donation.delete)
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          width: 1.0,
                                          color: const Color(0xFFCCCCCC),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    child: donation.image == ''
                                                        ? Image.network(
                                                            'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/finder_logo.png',
                                                            width: 60,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          )
                                                        : Image.network(
                                                            donation.image,
                                                            width: 60,
                                                            height: 60,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        width: 220,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              donation.title,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 17,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                await FirebaseFirestore
                                                                    .instance
                                                                    .collection(
                                                                        'donation_list')
                                                                    .doc(donation
                                                                        .number
                                                                        .toString())
                                                                    .set({
                                                                  'detail':
                                                                      donation
                                                                          .detail,
                                                                  'group':
                                                                      donation
                                                                          .group,
                                                                  'money':
                                                                      donation
                                                                          .money,
                                                                  'title':
                                                                      donation
                                                                          .title,
                                                                  'time':
                                                                      donation
                                                                          .time,
                                                                  'pass':
                                                                      donation
                                                                          .pass,
                                                                  'delete':
                                                                      false,
                                                                  'user':
                                                                      donation
                                                                          .user,
                                                                  'number':
                                                                      donation
                                                                          .number,
                                                                });

                                                                Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        ((BuildContext
                                                                                context) =>
                                                                            Home(
                                                                              page: 3,
                                                                              search_group: 0,
                                                                              my_group: 1,
                                                                              userID: widget.userID,
                                                                              donationList: widget.donationList,
                                                                              user_group: widget.user_group,
                                                                            )),
                                                                    fullscreenDialog:
                                                                        true,
                                                                  ),
                                                                );
                                                              },
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .blue, // Background color
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Text('삭제'),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              right: 5,
                                                              top: 5,
                                                            ),
                                                            child: Icon(
                                                              Icons.circle,
                                                              size: 10,
                                                              color: Color(
                                                                  0xFF007913),
                                                            ),
                                                          ),
                                                          Text(
                                                            donation.group,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 15,
                                                              color: Color(
                                                                  0xFF464646),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '${donation.money}원',
                                                        style: const TextStyle(
                                                          fontSize: 13,
                                                          color:
                                                              Color(0xFF464646),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '날짜:${donation.time.toDate()}',
                                                        style: const TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                              Color(0xFF464646),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        '내용 : ${donation.detail}',
                                                        style: const TextStyle(
                                                          fontSize: 10,
                                                          color:
                                                              Color(0xFF464646),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      })),
                ],
              )
            : Container(),
        my_group_ == 2
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((BuildContext context) => Home(
                                page: 3,
                                search_group: 1,
                                userID: widget.userID,
                                donationList: widget.donationList,
                                my_group: 0,
                                user_group: widget.user_group,
                              )),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text(
                        '< 마이페이지',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF3B3B3B)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 2;
                            });
                          },
                          child: my_group_ == 2
                              ? const Selected_button(button_text: '등록하기')
                              : const None_Selected_button(button_text: '등록하기'),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 1;
                            });
                          },
                          child: my_group_ == 1
                              ? const Selected_button(button_text: '등록 내역')
                              : const None_Selected_button(
                                  button_text: '등록 내역'),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 3;
                            });
                          },
                          child: my_group_ == 3
                              ? const Selected_button(button_text: '인증 내역')
                              : const None_Selected_button(
                                  button_text: '인증 내역'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1.0,
                          color: const Color(0xFFCCCCCC),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: Column(
                          children: [
                            TextField(
                              controller: title,
                              decoration: const InputDecoration(
                                labelText: '제목',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  donation_fuction();
                                });
                              },
                            ),
                            TextField(
                              controller: money,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                labelText: '금액',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  donation_fuction();
                                });
                              },
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFF999999),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Text(
                                      '분류',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF777777),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: SizedBox(
                                      width: 200,
                                      child: DropdownButton(
                                        isExpanded: true,
                                        value: selectedDropdown,
                                        items: dropdownList.map((String item) {
                                          return DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList(),
                                        onChanged: (dynamic value) {
                                          setState(() {
                                            selectedDropdown = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xFF999999),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: Text(
                                      '사진',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF777777),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: 200,
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 60, 60, 60),
                                            ),
                                            onPressed: () {
                                              image_exist = 1;
                                              myAlert();
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 15.0),
                                                  child: Icon(
                                                    CupertinoIcons.camera_fill,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('인증사진'),
                                              ],
                                            ),
                                          ),
                                          image != null
                                              ? Image.file(
                                                  File(image!.path),
                                                  fit: BoxFit.cover,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextField(
                              controller: detail,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: '내용',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  donation_fuction();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  loading
                      ? FutureBuilder(
                          future: groupusermodel,
                          builder: (context, groupsnapshot) {
                            if (groupsnapshot.hasData) {
                              return FutureBuilder(
                                  future: usermodel,
                                  builder: ((context, snapshot) {
                                    if (snapshot.hasData) {
                                      return FutureBuilder(
                                          future: donationnumber,
                                          builder:
                                              ((context, donationSnapshot) {
                                            if (donationSnapshot.hasData) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20.0,
                                                    right: 20,
                                                    bottom: 20),
                                                child: GestureDetector(
                                                    onTap: () async {
                                                      if (title
                                                              .text.isNotEmpty &&
                                                          detail.text
                                                              .isNotEmpty &&
                                                          image_exist != 0 &&
                                                          money.text
                                                              .isNotEmpty) {
                                                        setState(() {
                                                          loading = false;
                                                        });
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: ((BuildContext
                                                                    context) =>
                                                                Home(
                                                                  page: 0,
                                                                  search_group:
                                                                      1,
                                                                  userID: widget
                                                                      .userID,
                                                                  donationList:
                                                                      newdonationList,
                                                                  my_group: 0,
                                                                  user_group: widget
                                                                      .user_group,
                                                                )),
                                                            fullscreenDialog:
                                                                true,
                                                          ),
                                                        );

                                                        if (image != null) {
                                                          String
                                                              uniqueFileName =
                                                              DateTime.now()
                                                                  .millisecondsSinceEpoch
                                                                  .toString();

                                                          Reference
                                                              referenceRoot =
                                                              FirebaseStorage
                                                                  .instance
                                                                  .ref();

                                                          Reference
                                                              referenceDireImages =
                                                              referenceRoot
                                                                  .child(
                                                                      'images');

                                                          Reference
                                                              referenceImageToUpload =
                                                              referenceDireImages
                                                                  .child(
                                                                      uniqueFileName);

                                                          try {
                                                            await referenceImageToUpload
                                                                .putFile(File(
                                                                    image!
                                                                        .path));

                                                            imageUrl =
                                                                await referenceImageToUpload
                                                                    .getDownloadURL();
                                                          } catch (error) {}
                                                        }
                                                        newdonationList.add(
                                                            donationSnapshot
                                                                .data!.number
                                                                .toString());

                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'donation_list')
                                                            .doc(
                                                                donationSnapshot
                                                                    .data
                                                                    ?.number
                                                                    .toString())
                                                            .set({
                                                          'detail': detail.text,
                                                          'group':
                                                              selectedDropdown,
                                                          'money': int.parse(
                                                              money.text),
                                                          'title': title.text,
                                                          'time': now,
                                                          'pass': false,
                                                          'delete': true,
                                                          'user': widget.userID,
                                                          'image': imageUrl,
                                                          'number':
                                                              donationSnapshot
                                                                  .data?.number,
                                                        });
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'donation')
                                                            .doc('number')
                                                            .set({
                                                          'number':
                                                              donationSnapshot
                                                                      .data!
                                                                      .number +
                                                                  1,
                                                        });

                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection('user')
                                                            .doc(widget.userID)
                                                            .update({
                                                          'donation':
                                                              newdonationList,
                                                        });

                                                        List
                                                            newgroupdonationlist =
                                                            groupsnapshot
                                                                .data!.donation;

                                                        newgroupdonationlist.add(
                                                            donationSnapshot
                                                                .data!.number
                                                                .toString());

                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection('group')
                                                            .doc(widget
                                                                .user_group)
                                                            .update({
                                                          'donation':
                                                              newgroupdonationlist,
                                                        });

                                                        /*
                                                    await FirebaseFirestore.instance
                                                        .collection('group')
                                                        .doc(snapshot.data!.group)
                                                        .set({
                                                      'donation': ['1', '2', '4'],
                                                    });
                                                    */
                                                      }
                                                    },
                                                    child: Button(
                                                      text: '등록하기',
                                                      iconshape: Icons
                                                          .check_circle_outline_outlined,
                                                      backgroundcolor:
                                                          button_color,
                                                      textcolor: Colors.white,
                                                    )),
                                              );
                                            } else {
                                              return Button(
                                                text: '등록하기',
                                                iconshape: Icons
                                                    .check_circle_outline_outlined,
                                                backgroundcolor: button_color,
                                                textcolor: Colors.white,
                                              );
                                            }
                                          }));
                                    }
                                    return Container();
                                  }));
                            } else {
                              return Container();
                            }
                          })
                      : Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, bottom: 20),
                          child: Button(
                            text: '기부 업로드중',
                            iconshape: Icons.downloading_sharp,
                            backgroundcolor: button_color,
                            textcolor: Colors.white,
                          ),
                        ),
                ],
              )
            : Container(),
        my_group_ == 3
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((BuildContext context) => Home(
                                page: 3,
                                search_group: 1,
                                userID: widget.userID,
                                donationList: widget.donationList,
                                my_group: 0,
                                user_group: widget.user_group,
                              )),
                          fullscreenDialog: true,
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text(
                        '< 마이페이지',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFF3B3B3B)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 2;
                            });
                          },
                          child: my_group_ == 2
                              ? const Selected_button(button_text: '등록하기')
                              : const None_Selected_button(button_text: '등록하기'),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 1;
                            });
                          },
                          child: my_group_ == 1
                              ? const Selected_button(button_text: '등록 내역')
                              : const None_Selected_button(
                                  button_text: '등록 내역'),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 3;
                            });
                          },
                          child: my_group_ == 3
                              ? const Selected_button(button_text: '인증 내역')
                              : const None_Selected_button(
                                  button_text: '인증 내역'),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder(
                      future: getDonationdata2,
                      builder: ((context, donationSnapshot2) {
                        if (donationSnapshot2.hasData) {
                          return Column(
                            children: [
                              for (var donation in donationSnapshot2.data!)
                                if (donation.delete)
                                  if (donation.pass)
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            width: 1.0,
                                            color: const Color(0xFFCCCCCC),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      child: donation.image ==
                                                              ''
                                                          ? Image.network(
                                                              'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/finder_logo.png',
                                                              width: 60,
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                            )
                                                          : Image.network(
                                                              donation.image,
                                                              width: 60,
                                                              height: 60,
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                            ),

                                                      /*Image.network(
                                                                  '',
                                                                  width: 60,
                                                                  fit: BoxFit
                                                                      .fitWidth,
                                                                ),*/
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          donation.title,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 17,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Row(
                                                          children: [
                                                            const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(
                                                                right: 5,
                                                                top: 5,
                                                              ),
                                                              child: Icon(
                                                                Icons.circle,
                                                                size: 10,
                                                                color: Color(
                                                                    0xFF007913),
                                                              ),
                                                            ),
                                                            Text(
                                                              donation.group,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 15,
                                                                color: Color(
                                                                    0xFF464646),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          '${donation.money}원',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 13,
                                                            color: Color(
                                                                0xFF464646),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          '날짜:${donation.time.toDate()}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xFF464646),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          '내용 : ${donation.detail}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xFF464646),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      })),
                ],
              )
            : Container(),
      ],
    );
  }
}

class my_page_button extends StatelessWidget {
  final String text;
  const my_page_button({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.0,
            color: const Color(0xFFCCCCCC),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.chevron_right,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
