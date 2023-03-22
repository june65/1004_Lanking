class UserModel {
  final String name, group, instagram, tier;
  final List donation;
  final int money;
  final int used_money;

  UserModel.fromJson(Map<String, dynamic>? json)
      : name = json!['name'],
        group = json['group'],
        instagram = json['instagram'],
        tier = json['tier'],
        donation = json['donation'],
        money = json['money'],
        used_money = json['used_money'];
}
