// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:programming_playground/models/Book.dart';

import 'package:programming_playground/models/CoolThing.dart';
import 'package:programming_playground/services/CoolThingService.dart';

class BookService extends CoolThingService {
  @override
  String get BASE_URL => "https://gutendex.com/books/";

  @override
  Future<CoolThing?> getSingleThing(String input) async {
    http.Response response = await http.get(Uri.parse("$BASE_URL?id=$input"));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<dynamic> responseList =
          (json.decode(response.body)['results']) as List<dynamic>;
      Map<String, dynamic> randomHoliday =
          (responseList)[Random.secure().nextInt(responseList.length)];

      return Book(
        name: randomHoliday['title'],
        subtitle: randomHoliday['media_type'],
        downloads: randomHoliday['download_count'],
      );
    }
    return null;
  }
}
