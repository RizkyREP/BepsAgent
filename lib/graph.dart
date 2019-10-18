import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

var dummyGraph1 = [
  1.0,
  1.3,
  1.5,
  1.8,
  2.2,
  1.0,
  2.0,
  3.0,
  2.5,
  3.1,
  2.4,
  3.0,
  3.5,
  4.0,
  3.5,
  3.0,
  3.0,
  3.0,
  4.0,
  5.0,
  5.0,
  4.0,
  4.2,
  3.0,
  3.5,
  3.0,
  4.0,
  5.0,
  4.0,
  5.0,
];
var dummyGraph2 = [
  5.0,
  4.5,
  4.2,
  3.7,
  4.5,
  4.2,
  3.7,
  4.2,
  3.7,
  4.5,
  3.0,
  2.5,
  2.3,
  2.5,
  2.9,
  3.5,
  2.7,
  2.0,
  1.5,
  1.2,
  1.0
];

class Graph extends StatefulWidget {
  @override
  _GraphState createState() => _GraphState();
}


class _GraphState extends State<Graph> {

  Map<String, double> dataMap = new Map();

  showGraph() {
    dataMap.putIfAbsent("LinkAja", () => 1);
    dataMap.putIfAbsent("BepsPay", () => 5);
    dataMap.putIfAbsent("GOPAY", () => 2);
    dataMap.putIfAbsent("Wechat", () => 3);
    dataMap.putIfAbsent("OVO", () => 4);
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 1000),
        chartValuesColor: Colors.black.withOpacity(0.5),
        legendFontColor: Colors.grey[600],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
