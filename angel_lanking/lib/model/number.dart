class DonationnumberModel {
  final int number;

  DonationnumberModel.fromJson(Map<String, dynamic>? json)
      : number = json!['number'];
}
