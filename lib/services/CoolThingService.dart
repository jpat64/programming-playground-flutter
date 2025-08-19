// ignore_for_file: file_names
import 'package:programming_playground/models/CoolThing.dart';

abstract class CoolThingService {
  // ignore: non_constant_identifier_names
  String get BASE_URL;

  Future<CoolThing?> getSingleThing(String input);
}
