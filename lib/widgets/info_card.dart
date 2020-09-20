import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'line_chart.dart';
import '../utils/constants.dart';

class InfoCard extends StatelessWidget {
    final String title;
    final int affectedNum;
    final Color iconColor;
    final Function press;

    const InfoCard({
        Key key, this.title, this.affectedNum, this.iconColor, this.press,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return LayoutBuilder(
            builder: (context, constraints) {
                return GestureDetector(
                    onTap: press,
                  child: Container(
                      width: constraints.maxWidth /2 - 10,
                      // Here the constraints max width provide us with the available width for the widget
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
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                  color: iconColor.withOpacity(0.12),
                                                  shape: BoxShape.circle,
                                              ),
                                              child: SvgPicture.asset(
                                                  "assets/icons/running.svg",
                                                  height: 12,
                                                  width: 12,
                                                  color: iconColor,
                                              ),
                                          ),
                                          SizedBox(
                                              width: 5,
                                          ),
                                          Expanded(
                                              child: Text(
                                                  title,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                              ),
                                          ),

                                      ],
                                  ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                      children: <Widget>[
                                          Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: RichText(
                                                  text: TextSpan(
                                                      style: TextStyle(color: KTextColor),
                                                      children: [
                                                          TextSpan(
                                                              text: "$affectedNum \n",
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
                              ),
                          ],
                      ),
                  ),
                );
            }
        );
    }
}