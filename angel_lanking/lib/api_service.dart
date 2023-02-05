import 'dart:convert';

import 'package:angel_lanking/model/asfasd.dart';
import 'package:angel_lanking/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<UserModel> getUserdata(String Userid) async {
    var result =
        await FirebaseFirestore.instance.collection('user').doc(Userid).get();
    return UserModel.fromJson(result.data());
  }

  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
