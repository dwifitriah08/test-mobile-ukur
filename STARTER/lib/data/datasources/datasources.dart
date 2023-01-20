import 'dart:convert';

import 'package:fake_json/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


// Future<List<UserResponse>> loadLocalRecipe() async {
// try {
// String response = await rootBundle.loadString('assets/users_responses.json');


// final result = json.decode(response);
//     return result.map((n) => UserResponse.fromJson(n)).toList();
//   } catch (error, stacktrace) {
//       print("Exception occured: $error stackTrace: $stacktrace");
//       // return UserResponse.withError("Data not found / Connection issue");
//       return [];
//     }
// }

Future<List<UserResponse>> loadLocalRecipe() async {
try {
String response = await rootBundle.loadString('assets/users_responses.json');


List<dynamic> result = json.decode(response);
    return result.map((n) => UserResponse.fromJson(n)).toList();
  } catch (e) {
    throw UserResponse.withError("error");
  }
}

class NetworkError extends Error {}