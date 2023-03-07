import 'package:cloud_firestore/cloud_firestore.dart';

class DonationModel2 {
  final String group, title, detail, user;
  final int money, number;
  final Timestamp time;
  final bool pass, delete;
  final String image;
  DonationModel2.fromJson(Map<String, dynamic>? json)
      : group = json!['group'],
        money = json['money'],
        title = json['title'],
        detail = json['detail'],
        time = json['time'],
        user = json['user'],
        pass = json['pass'],
        delete = json['delete'],
        number = json['number'],
        image = json['image'];
}
