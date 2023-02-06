import 'package:cloud_firestore/cloud_firestore.dart';

class DonationModel {
  final String ratio, group, name;
  final int money;
  final Timestamp time;

  DonationModel.fromJson(Map<String, dynamic>? json)
      : ratio = json!['ratio'],
        group = json['group'],
        money = json['money'],
        name = json['name'],
        time = json['time'];
}
