import 'dart:convert';
import '../app_common/app_data.dart';

class BaseRepository {
  header() => {
        'Authorization': 'Bearer ${AppData.token}',
        'accept': 'application/json',
      };
}
