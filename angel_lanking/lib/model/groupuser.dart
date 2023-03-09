class GroupUserModel {
  final List user, donation;

  GroupUserModel.fromJson(Map<String, dynamic>? json)
      : donation = json!['donation'],
        user = json['user'];
}
