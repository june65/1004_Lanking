import 'package:angel_lanking/model/donation.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiService {
  static Future<UserModel> getUserdata(String Userid) async {
    var result =
        await FirebaseFirestore.instance.collection('user').doc(Userid).get();
    print(result.data().toString());

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
}
