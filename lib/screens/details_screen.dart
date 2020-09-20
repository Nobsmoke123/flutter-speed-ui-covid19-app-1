import '../utils/constants.dart';
import '../widgets/weekly_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailScreen extends StatelessWidget {
    static const screenId = 'details_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 21),
                                      blurRadius: 53,
                                      color: Colors.black.withOpacity(0.05),
                                  )
                              ]
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                  buildWithMoreIcon(),

                                  SizedBox(height: 15,),

                                  buildCaseNumber(context),

                                  Text(
                                      "From Health Center",
                                      style: TextStyle(
                                          color: KTextMediumColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w200,
                                      ),
                                  ),

                                  SizedBox(height: 10,),

                                  WeeklyChart(),

                                  SizedBox(height: 10,),

                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                          buildInfoTextWithPercentage(
                                              title: "From Last Week",
                                              percentage: "6.43"
                                          ),

                                          buildInfoTextWithPercentage(
                                              title: "Recovery Rate",
                                              percentage: "9.43"
                                          ),
                                      ],
                                  ),
                              ],
                          ),
                      ),

                      SizedBox(height: 20,),

                      Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 21),
                                      blurRadius: 54,
                                      color: Colors.black.withOpacity(0.05),
                                  )
                              ]
                          ),
                          child: Column(
                              children: <Widget>[
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                          Text(
                                              "Global Map",
                                              style: TextStyle(
                                                  fontSize: 15
                                              ),
                                          ),

                                          SvgPicture.asset("assets/icons/more.svg"),
                                      ],
                                  ),

                                  SizedBox(height: 10,),

                                  SvgPicture.asset("assets/icons/map.svg"),

                                  SizedBox(height: 10,),
                              ],
                          ),
                      ),
                  ],
              ),
            ),
        ),
    );
  }

  RichText buildInfoTextWithPercentage({ String title, String percentage}) {
    return RichText(
          text: TextSpan(
              children: [
                  TextSpan(
                      text: "$percentage% \n",
                      style: TextStyle(
                          fontSize: 20,
                          color: KPrimaryColor
                      )
                  ),

                  TextSpan(
                      text: "$title",
                      style: TextStyle(
                          color: KTextMediumColor,
                          height: 1.5,
                      )
                  )
              ]
          )
      );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
        children: <Widget>[
            Text(
                "574",
                style: Theme.of(context).textTheme.headline2.copyWith(color: KPrimaryColor, height: 1.2),
            ),

            SizedBox(width: 20,),

            Text(
                "5.9%",
                style: TextStyle(color: KPrimaryColor),
            ),

            SizedBox(width: 5,),

            SvgPicture.asset("assets/icons/increase.svg"),

        ],
      );
  }

  Row buildWithMoreIcon() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
              Text(
                  "New cases",
                  style: TextStyle(
                      color: KTextMediumColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                  ),
              ),
              SvgPicture.asset("assets/icons/more.svg"),
          ],
      );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
          backgroundColor: KBackgroundColor,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                  Icons.arrow_back,
                  color: KPrimaryColor,
              ),
              onPressed: (){
                  Navigator.pop(context);
              },
          ),
          actions: <Widget>[
              IconButton(
                  icon: SvgPicture.asset("assets/icons/search.svg"),
                  onPressed: (){},
              )
          ],
      );
  }
}
