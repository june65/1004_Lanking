import 'package:cloud_firestore/cloud_firestore.dart';

class DonationModel {
  final String group, name;
  final int money;
  final Timestamp time;

  DonationModel.fromJson(Map<String, dynamic>? json)
      : group = json!['group'],
        money = json['money'],
        name = json['name'],
        time = json['time'];
}
