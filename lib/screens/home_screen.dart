import 'package:covid19app1/utils/constants.dart';
import 'package:covid19app1/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './../widgets/line_chart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: KPrimaryColor.withOpacity(0.03),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                    )
                ),
                child: Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: <Widget>[
                        InfoCard(
                            title: "Confirmed Case",
                            iconColor: Color(0xFFFF8C00),
                            affectedNum: 1062,
                        ),

                        InfoCard(
                            title: "Total Deaths",
                            iconColor: Color(0xFFFF2D55),
                            affectedNum: 75,
                        ),

                        InfoCard(
                            title: "Total Recovered",
                            iconColor: Color(0xFF50E3C2),
                            affectedNum: 689,
                        ),

                        InfoCard(
                            title: "New Cases",
                            iconColor: Color(0xFF5856D6),
                            affectedNum: 1062,
                        )
                    ],
                ),
            ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        'Preventions',
                        style: Theme.of(context).textTheme.title.copyWith(fontWeight: FontWeight.bold),
                    ),
                      SizedBox(height: 20,),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                              PreventionCard(
                                  svgSrc: "assets/icons/hand_wash.svg",
                                  title: "Wash Hands",
                              ),

                              PreventionCard(
                                  svgSrc: "assets/icons/use_mask.svg",
                                  title: "Use Masks",
                              ),

                              PreventionCard(
                                  svgSrc: "assets/icons/Clean_Disinfect.svg",
                                  title: "Clean Disinfect",
                              ),
                          ],
                      ),
                  ],
                ),
              )
          ],
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

class PreventionCard extends StatelessWidget {
    final String svgSrc;
    final String title;

  const PreventionCard({
    Key key, this.svgSrc, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
            SvgPicture.asset(svgSrc),
            Text(title, style: Theme.of(context).textTheme.bodyText2.copyWith(color: KPrimaryColor),)
        ],
    );
  }
}
