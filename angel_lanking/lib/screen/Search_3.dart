import 'package:angel_lanking/widget/Celebrity.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Search_3 extends StatefulWidget {
  const Search_3({super.key});

  @override
  State<Search_3> createState() => _Search_3State();
}

class _Search_3State extends State<Search_3> {
  @override
  void initState() {
    super.initState();
    _loadCSV('assets/data/philanthropy50.csv');
  }

  late List<List<dynamic>> _data = [];

  void _loadCSV(path) async {
    final rawData = await rootBundle.loadString(path);
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    setState(() {
      _data = listData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                //Outline border type for TextFeild
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              labelText: '유튜버 / 연예인 / 방송인',
            ),
          ),
        ),
        Column(
          children: [
            for (var data in _data)
              Celebrity(
                  name: '${data[3]}. ${data[1]}',
                  group: data[5].toString(),
                  lank: 'MASTER',
                  point: data[4].toString(),
                  cost: data[2].toString(),
                  start: 1000000,
                  end: 1000000,
                  image: data[0].toString(),
                  userID: '',
                  donationList: const [],
                  getDonationdata: const [])
            //Text(data[1].toString()),
          ],
        ),
      ],
    );
  }
}
