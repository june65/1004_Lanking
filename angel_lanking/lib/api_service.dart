import 'package:angel_lanking/model/donation.dart';
import 'package:angel_lanking/model/donation2.dart';
import 'package:angel_lanking/model/donation_type.dart';
import 'package:angel_lanking/model/groupuser.dart';
import 'package:angel_lanking/model/number.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
}
