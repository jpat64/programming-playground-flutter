// ignore_for_file: file_names

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:programming_playground/models/CoolThing.dart';

class CoolThingService {
  // ignore: constant_identifier_names
  static const String BASE_URL = "https://date.nager.at/api/v3/";

  Future<CoolThing?> getSingleThing(String input) async {
    http.Response response = await http.get(
      Uri.parse("${BASE_URL}NextPublicHolidays/$input"),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<dynamic> responseList = json.decode(response.body) as List<dynamic>;
      Map<String, dynamic> randomHoliday =
          (responseList)[Random.secure().nextInt(responseList.length)];

      return CoolThing(
        name: randomHoliday['localName'],
        subtitle: randomHoliday['date'],
      );
    }
    return null;
  }
}
