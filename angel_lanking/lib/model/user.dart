class UserModel {
  final String name, group, instagram;
  final List donation;

  UserModel.fromJson(Map<String, dynamic>? json)
      : name = json!['name'],
        group = json['group'],
        instagram = json['instagram'],
        donation = json['donation'];
}
