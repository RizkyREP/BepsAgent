// import 'dart:async';
// import 'dart:convert';

// import 'package:bepsagent/var.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'package:bepsagent/var.dart';
// import 'package:bepsagent/postService.dart';
// import 'package:bepsagent/main.dart';

// class Post extends State<MyHomePage> {

// Future<String> getData() async {
//   http.Response response = await http.get(
//       Uri.encodeFull('https://jsonplaceholder.typicode.com/posts'),
//       headers: {'Accept': 'application/json'});
//   getResponse = json.decode(response.body);

//   print(getResponse[1]['title']);

//   setState(() {
//     getResponse = getResponse;
//     title = (getResponse[1]['title']);
//     body = (getResponse[1]);
//   });

// }

//   @override
//   Widget build(BuildContext context) {
//     return null;
//   }

// // void setState(Null Function() param0) {}
// }