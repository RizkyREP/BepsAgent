import 'dart:async';
import 'dart:convert';

import 'package:bepsagent/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:bepsagent/var.dart';
import 'package:bepsagent/main.dart';

// Future<String> post() async {
//   try {
//     http.Response response = await http.post(Uri.encodeFull(loginUrl()),
//         headers: {'Accept': 'application/json'}, body: json.encode({}));
//     postDevResponse = json.decode(response.body);

//     print(postDevResponse);
//     print('Access Token : ${postDevResponse['access_token']}');
//     return access_token = '${postDevResponse['access_token']}';
//   } catch (e) {
//     print("No Connection to Om Hansen");
//   }
// }

// Future<String> get() async {
//   http.Response response =
//       await http.get(Uri.encodeFull(userInfoUrl()), headers: {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer ' + access_token,
//   });
//   getDevResponse = json.decode(response.body);

//   print(getDevResponse);
//   print('${getDevResponse[0]['email']}');

  // setState(() {
  //   getDevResponse = getDevResponse;
  //   email = '${getDevResponse[0]['email']}';
  // });
// }
