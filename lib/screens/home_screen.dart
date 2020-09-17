import 'package:covid19app1/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Container(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 40),
            width: double.infinity,
            decoration: BoxDecoration(
                color: KPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                )
            ),
            child: Wrap(
                children: <Widget>[
                    Container(
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                            children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: <Widget>[
                                        Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                  color: Color(0xFFFF9C00).withOpacity(0.12),
                                                  shape: BoxShape.circle,
                                            ),
                                            child: SvgPicture.asset(
                                                "assets/icons/running.svg",
                                                height: 12,
                                                width: 12,
                                            ),
                                        ),
                                        SizedBox(
                                            width: 5,
                                        ),
                                        Text(
                                          "Confirmed Cases",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),

                                    ],
                                  ),
                                ),
                                Row(
                                    children: <Widget>[
                                       Padding(
                                         padding: const EdgeInsets.all(10.0),
                                         child: RichText(
                                             text: TextSpan(
                                                 style: TextStyle(color: KTextColor),
                                                 children: [
                                                     TextSpan(
                                                         text: "1,602 \n",
                                                         style: Theme.of(context).textTheme.title.copyWith(
                                                             fontWeight: FontWeight.bold
                                                         ),
                                                     ),
                                                     TextSpan(
                                                         text: "People",
                                                         style: TextStyle(
                                                             fontSize: 12,
                                                             height: 2
                                                         ),
                                                     ),

                                                 ]
                                             ),
                                         ),
                                       ),
                                        Expanded(child: LineReportChart(),)
                                    ],
                                ),
                            ],
                        ),
                    )
                ],
            ),
        ),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
          backgroundColor: KPrimaryColor.withOpacity(.03),
          elevation: 0,
          leading: IconButton(
              icon: SvgPicture.asset("assets/icons/menu.svg"),
              onPressed: (){},
          ),
          actions: <Widget>[
              IconButton(
                  icon: SvgPicture.asset("assets/icons/search.svg"),
                  onPressed: (){},
              ),
          ],
      );
  }
}


class LineReportChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.2,
        child: LineChart(
            LineChartData(
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(show: false),
                lineBarsData: [
                    LineChartBarData(
                        spots: getSpots(),
                        isCurved: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                        colors: [KPrimaryColor],
                        barWidth: 4,
                    )
                ]
            )
        ),
    );
  }

  List<FlSpot> getSpots() {
      return [
          FlSpot(0, .5),
          FlSpot(1, 1.5),
          FlSpot(2, .5),
          FlSpot(3, .7),
          FlSpot(4, .2),
          FlSpot(5, 2),
          FlSpot(6, 1.5),
          FlSpot(7, 1.7),
          FlSpot(8, 1),
          FlSpot(9, 2.8),
          FlSpot(10, 2.5),
          FlSpot(11, 2.65),

      ];
  }
}
