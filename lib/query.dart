// import 'dart:convert';
// import 'dart:io';
// import 'package:bepsagent/var.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// import 'package:bepsagent/login.dart';
// import 'package:bepsagent/var.dart';
// import 'package:bepsagent/graph.dart' as graph;
// import 'package:flutter/material.dart';
// import 'package:flutter_sparkline/flutter_sparkline.dart';
// import 'package:http/http.dart' as http;
// import 'package:bepsagent/profil.dart';
// import 'package:http/io_client.dart';

// import 'graph.dart';
// import 'detailTransaksi.dart';
// import 'package:pie_chart/pie_chart.dart';
// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';



// query() async {
//       bool trustSelfSigned = true;
//     HttpClient httpClient = new HttpClient()
//       ..badCertificateCallback =
//           ((X509Certificate cert, String host, int port) => trustSelfSigned);
//     IOClient ioClient = new IOClient(httpClient);

//     try {
//       http.Response trxResponses =
//           await ioClient.get(Uri.encodeFull(getTrxUrl()), headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer ' + access_token,
//       });

//       trxResponse = json.decode(trxResponses.body);
//       print(trxResponse['content']);

//     } catch (e) {
//       isLoading = false;
//       print("Fetch Data Failed");
//     }
// }