class GroupUserModel {
  final List user, donation;
  final String image, name;
  final int money;

  GroupUserModel.fromJson(Map<String, dynamic>? json)
      : donation = json!['donation'],
        user = json['user'],
        image = json['image'],
        name = json['name'],
        money = json['money'];
}
