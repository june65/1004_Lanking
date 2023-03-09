class GroupUserModel {
  final List user, donation;
  final String image, name;

  GroupUserModel.fromJson(Map<String, dynamic>? json)
      : donation = json!['donation'],
        user = json['user'],
        image = json['image'],
        name = json['name'];
}
