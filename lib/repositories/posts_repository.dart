import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:maaly_alkhayr_test_project/app_common/app_data.dart';
import 'package:maaly_alkhayr_test_project/repositories/base_repository.dart';

class PostsRepository extends BaseRepository{
  getPosts() async {
    var response= await http.get(
        Uri.parse('${AppData.baseURL}/posts/v1/all?page=1'),
        headers: header());
    var result = jsonDecode(response.body);
    return result;
  }
}