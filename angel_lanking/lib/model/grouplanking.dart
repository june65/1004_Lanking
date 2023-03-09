class GroupLankingModel {
  final List lanking;

  GroupLankingModel.fromJson(Map<String, dynamic>? json)
      : lanking = json!['lanking'];
}
