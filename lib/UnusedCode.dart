/*     

  List<charts.Series<Task, String>> _seriesPieData;
  _generateData() {
    var pieData = [
      new Task('Work', 1, Color(0xff3366cc)),
      new Task('Eat', 1, Color(0xff990099)),
      new Task('Commute', 1, Color(0xff109618)),
      new Task('TV', 1, Color(0xfffdbe19)),
      new Task('Sleep', 1, Color(0xffff9900)),
      new Task('Other', 1, Color(0xffdc3912)),
    ];
    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskValue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorVal),
        id: 'Daily Task',
        labelAccessorFn: (Task row, _) => '${row.taskValue}',
      ),
    );
  }

      _seriesPieData = List<charts.Series<Task, String>>();
    _generateData();

                     
                      Expanded(
                        child: charts.PieChart(
                          _seriesPieData,
                          animate: true,
                          animationDuration: Duration(milliseconds: 1000),
                          // behaviors: [
                          //   new charts.DatumLegend(
                          //       outsideJustification:
                          //           charts.OutsideJustification.endDrawArea,
                          //       horizontalFirst: false,
                          //       desiredMaxRows: 2,
                          //       cellPadding: new EdgeInsets.only(
                          //           right: 4.0, bottom: 4.0),
                          //       entryTextStyle: charts.TextStyleSpec(
                          //           color: charts
                          //               .MaterialPalette.purple.shadeDefault,
                          //           fontSize: 11))
                          // ],
                          defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 300,
                              arcRendererDecorators: [
                                new charts.ArcLabelDecorator(
                                    labelPosition:
                                        charts.ArcLabelPosition.inside)
                              ]),
                        ),
                      )
                      
class Task {
  String task;
  double taskValue;
  Color colorVal;

  Task(this.task, this.taskValue, this.colorVal);
}

*/



/*
Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel<Event>(
          onDayPressed: (DateTime date, List<Event> events) {
            
                    this.setState(() => _currentDate = date);
          },
          weekendTextStyle: TextStyle(
            color: Colors.red,
          ),
          thisMonthDayBorderColor: Colors.grey,
    //      weekDays: null, /// for pass null when you do not want to render weekDays
    //      headerText: Container( /// Example for rendering custom header
    //        child: Text('Custom Header'),
    //      ),
          customDayBuilder: (   /// you can provide your own build function to make custom day containers
            bool isSelectable,
            int index,
            bool isSelectedDay,
            bool isToday,
            bool isPrevMonthDay,
            TextStyle textStyle,
            bool isNextMonthDay,
            bool isThisMonthDay,
            DateTime day,
          ) {
              /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
              /// This way you can build custom containers for specific days only, leaving rest as default.
    
              // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
              if (day.day == 15) {
                return Center(
                  child: Icon(Icons.local_airport),
                );
              } else {
                return null;
              }
          },
          weekFormat: false,
          markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate,
      daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
    ),
  )
  */