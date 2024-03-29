import 'package:angel_lanking/model/donation.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/model/donation_type.dart';
import 'package:angel_lanking/model/grouplanking.dart';
import 'package:angel_lanking/model/groupuser.dart';
import 'package:angel_lanking/model/number.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ApiService {
  static Future<UserModel> getUserdata(String Userid) async {
    var result =
        await FirebaseFirestore.instance.collection('user').doc(Userid).get();

    return UserModel.fromJson(result.data());
  }

  static Future<List<DonationModel>> getDonationdata(
      List userDonationList) async {
    List<DonationModel> DonationInstances = [];
    var result = await FirebaseFirestore.instance
        .collection('donation')
        .doc('list')
        .get();

    int num = result.data()!.length;
    for (int i = 1; i <= num; i++) {
      for (var number in userDonationList) {
        if (i.toString() == number) {
          final instance = DonationModel.fromJson(result.data()![i.toString()]);
          DonationInstances.add(instance);
        }
      }
    }
    return DonationInstances;
  }

  static Future<bool> findUserdata(String Userid) async {
    var findUserdataResult = '';
    var findUser =
        await FirebaseFirestore.instance.collection('user').doc(Userid).get();

    findUserdataResult = findUser.toString();

    if (findUserdataResult == '') {
      return true;
    } else {
      return false;
    }
  }

  static Future<DonationTypeModel> getDonationtype() async {
    var result = await FirebaseFirestore.instance
        .collection('donation')
        .doc('type')
        .get();

    return DonationTypeModel.fromJson(result.data());
  }

  static Future<DonationnumberModel> getDonationnumber() async {
    var result = await FirebaseFirestore.instance
        .collection('donation')
        .doc('number')
        .get();

    return DonationnumberModel.fromJson(result.data());
  }

  static Future<List<DonationModel2>> getDonationdata2(
      List userDonationList) async {
    List<DonationModel2> DonationInstances2 = [];

    int num = userDonationList.length;

    for (int i = 0; i < num; i++) {
      var result = await FirebaseFirestore.instance
          .collection('donation_list')
          .doc(userDonationList[i])
          .get();
      final instance = DonationModel2.fromJson(result.data());
      DonationInstances2.add(instance);
    }
    return DonationInstances2;
  }

  static Future<GroupUserModel> getGroupUser(String Groupid) async {
    var result =
        await FirebaseFirestore.instance.collection('group').doc(Groupid).get();

    return GroupUserModel.fromJson(result.data());
  }

  static Future<GroupLankingModel> getGroupLanking() async {
    var result = await FirebaseFirestore.instance
        .collection('lanking')
        .doc('group')
        .get();

    return GroupLankingModel.fromJson(result.data());
  }

  static Future<List<GroupUserModel>> getGroupList() async {
    var grouplankinglist = ['GIST', 'KAIST'];

    List<GroupUserModel> DonationInstances2 = [];

    for (int i = 0; i < grouplankinglist.length; i++) {
      var result2 = await FirebaseFirestore.instance
          .collection('group')
          .doc(grouplankinglist[i])
          .get();

      final instance = GroupUserModel.fromJson(result2.data());
      DonationInstances2.add(instance);
    }
    return DonationInstances2;
  }

  static Future<List<dynamic>> getDonationPointdata(
      List<DonationModel2> DonationPointList, num money) async {
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
    Sum += money.toInt();
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

  static var money_f = NumberFormat('###,###,###,###');
}
