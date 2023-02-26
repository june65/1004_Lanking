import 'dart:io';
import 'package:angel_lanking/api_service.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/model/donation_type.dart';
import 'package:angel_lanking/model/number.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:angel_lanking/screen/Home.dart';
import 'package:angel_lanking/screen/Home_3.dart';
import 'package:angel_lanking/widget/Button.dart';
import 'package:angel_lanking/widget/Graph.dart';
import 'package:angel_lanking/widget/Lanking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Home_4 extends StatefulWidget {
  final String userID;
  final List donationList;
  final int my_group;
  final List<DonationModel2> getDonationdata;
  const Home_4({
    super.key,
    required this.userID,
    required this.donationList,
    required this.my_group,
    required this.getDonationdata,
  });

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

  TextEditingController title = TextEditingController();
  TextEditingController detail = TextEditingController();
  TextEditingController money = TextEditingController();

  List<String> dropdownList = ['child', 'old', 'world'];
  String selectedDropdown = 'child';
  int my_group_ = 0;

  XFile? image;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

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
    donationpoint = getDonationPointdata(widget.getDonationdata);
  }

  static Future<List<num>> getDonationGroupdata(List DonationGroupList) async {
    late num Child = 0;
    late num Old = 0;
    late num World = 0;
    late num Others = 0;

    for (int i = 0; i < DonationGroupList.length; i++) {
      if (DonationGroupList[i].group == 'child') {
        Child += DonationGroupList[i].money;
      }
      if (DonationGroupList[i].group == 'old') {
        Old += DonationGroupList[i].money;
      }
      if (DonationGroupList[i].group == 'world') {
        World += DonationGroupList[i].money;
      }
      if (DonationGroupList[i].group == 'others') {
        Others += DonationGroupList[i].money;
      }
    }
    return [Child, Old, World, Others];
  }

  int total = 100000000;

  static Future<List<dynamic>> getDonationPointdata(
      List<DonationModel2> DonationGroupList) async {
    late int Sum = 0;

    for (int i = 0; i < DonationGroupList.length; i++) {
      if (DonationGroupList[i].pass) {
        Sum += DonationGroupList[i].money;
      }
    }
    late String tear = 'unranked';

    if (Sum > 0) {
      tear = 'bronze';
    } else if (Sum > 30000) {
      tear = 'silver';
    } else if (Sum > 100000) {
      tear = 'gold';
    } else if (Sum > 200000) {
      tear = 'platinum';
    } else if (Sum > 500000) {
      tear = 'Diamond';
    } else if (Sum > 1000000) {
      tear = 'master';
    }
    return [Sum, tear];
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
                                    lank: '${snapshotpoint.data![1]} III 80%',
                                    point: 0,
                                    cost: snapshotpoint.data![0],
                                    total: total,
                                    userID: widget.userID,
                                    donationList: widget.donationList,
                                  );
                                }
                                return Lanking(
                                  name: '...',
                                  group: '...',
                                  lank: '...',
                                  point: 0,
                                  cost: 1000,
                                  total: 2000,
                                  userID: widget.userID,
                                  donationList: widget.donationList,
                                );
                              });
                        }
                        return Lanking(
                          name: '...',
                          group: '...',
                          lank: '...',
                          point: 0,
                          cost: 1000,
                          total: 2000,
                          userID: widget.userID,
                          donationList: widget.donationList,
                        );
                      })),
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
                      text: '기부등록',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        my_group_ = 1;
                      });
                    },
                    child: const my_page_button(
                      text: '기부내역',
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
                              my_group_ = 1;
                            });
                          },
                          child: my_group_ == 1
                              ? const Selected_button(button_text: '기부내역')
                              : const None_Selected_button(button_text: '기부내역'),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 2;
                            });
                          },
                          child: my_group_ == 2
                              ? const Selected_button(button_text: '기부등록')
                              : const None_Selected_button(button_text: '기부등록'),
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
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child: Image.network(
                                                    'https://dogmbti.s3.ap-northeast-2.amazonaws.com/1004_lanking/finder_logo.png',
                                                    width: 60,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      donation.title,
                                                      style: const TextStyle(
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
                              my_group_ = 1;
                            });
                          },
                          child: my_group_ == 1
                              ? const Selected_button(button_text: '기부내역')
                              : const None_Selected_button(button_text: '기부내역'),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              my_group_ = 2;
                            });
                          },
                          child: my_group_ == 2
                              ? const Selected_button(button_text: '기부등록')
                              : const None_Selected_button(button_text: '기부등록'),
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
                  FutureBuilder(
                      future: usermodel,
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return FutureBuilder(
                              future: donationnumber,
                              builder: ((context, donationSnapshot) {
                                if (donationSnapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20, bottom: 20),
                                    child: GestureDetector(
                                        onTap: () async {
                                          newdonationList.add(donationSnapshot
                                              .data!.number
                                              .toString());
                                          if (title.text.isNotEmpty &&
                                              detail.text.isNotEmpty &&
                                              image_exist != 0 &&
                                              money.text.isNotEmpty) {
                                            await FirebaseFirestore.instance
                                                .collection('donation_list')
                                                .doc(donationSnapshot
                                                    .data?.number
                                                    .toString())
                                                .set({
                                              'detail': detail.text,
                                              'group': selectedDropdown,
                                              'money': int.parse(money.text),
                                              'title': title.text,
                                              'time': now,
                                              'pass': false,
                                              'user': widget.userID,
                                            });
                                            await FirebaseFirestore.instance
                                                .collection('donation')
                                                .doc('number')
                                                .set({
                                              'number': donationSnapshot
                                                      .data!.number +
                                                  1,
                                            });
                                            await FirebaseFirestore.instance
                                                .collection('user')
                                                .doc(widget.userID)
                                                .set({
                                              'name': snapshot.data!.name,
                                              'donation': newdonationList,
                                              'instagram':
                                                  snapshot.data!.instagram,
                                              'group': snapshot.data!.group
                                            });
                                            /*
                                            await FirebaseFirestore.instance
                                                .collection('group')
                                                .doc(snapshot.data!.group)
                                                .set({
                                              'donation': ['1', '2', '4'],
                                            });
                                            */

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    ((BuildContext context) =>
                                                        Home(
                                                          page: 0,
                                                          search_group: 1,
                                                          userID: widget.userID,
                                                          donationList:
                                                              newdonationList,
                                                          my_group: 0,
                                                        )),
                                                fullscreenDialog: true,
                                              ),
                                            );
                                          }
                                        },
                                        child: Button(
                                          text: '등록하기',
                                          iconshape: Icons
                                              .check_circle_outline_outlined,
                                          backgroundcolor: button_color,
                                          textcolor: Colors.white,
                                        )),
                                  );
                                } else {
                                  return Button(
                                    text: '등록하기',
                                    iconshape:
                                        Icons.check_circle_outline_outlined,
                                    backgroundcolor: button_color,
                                    textcolor: Colors.white,
                                  );
                                }
                              }));
                        }
                        return Container();
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
