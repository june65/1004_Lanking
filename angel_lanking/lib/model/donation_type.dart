class DonationTypeModel {
  final String child, old, world;

  DonationTypeModel.fromJson(Map<String, dynamic>? json)
      : child = json!['Child'],
        old = json['Old'],
        world = json['World'];
}
