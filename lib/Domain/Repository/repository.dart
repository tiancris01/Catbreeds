import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../Data/Models/cat_model.dart';

const String url = "https://api.thecatapi.com/v1/breeds/";

List<Cat> catFromJson(String str) =>
    List<Cat>.from(json.decode(str).map((x) => Cat.fromJson(x)));

Future<List<Cat>> fetchCat() async {
  final http.Response response = await http.get(Uri.parse(url), headers: {
    'Content-Type': 'application/json',
    'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'
  });

  if (response.statusCode == 200) {
    return compute(catFromJson, response.body);
  } else {
    throw Exception(response.statusCode);
  }
}
