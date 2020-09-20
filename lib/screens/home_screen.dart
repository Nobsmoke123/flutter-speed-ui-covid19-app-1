import './../widgets/prevention_card.dart';
import '../utils/constants.dart';
import '../widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
    static const screenId = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
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
                              press: (){
                                  Navigator.of(context).pushNamed(DetailScreen.screenId);
                              },
                          ),

                          InfoCard(
                              title: "Total Deaths",
                              iconColor: Color(0xFFFF2D55),
                              affectedNum: 75,
                              press: (){
                                  Navigator.of(context).pushNamed(DetailScreen.screenId);
                              },
                          ),

                          InfoCard(
                              title: "Total Recovered",
                              iconColor: Color(0xFF50E3C2),
                              affectedNum: 689,
                              press: (){
                                  Navigator.of(context).pushNamed(DetailScreen.screenId);
                              },
                          ),

                          InfoCard(
                              title: "New Cases",
                              iconColor: Color(0xFF5856D6),
                              affectedNum: 62,
                              press: (){
                                  Navigator.of(context).pushNamed(DetailScreen.screenId);
                              },
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
                          style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.bold),
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

                        SizedBox( height: 40,),

                        Container(
                          height: 150,
                          width: double.infinity,
                          child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.only(
                                          //Left side padding 40% of the total width
                                          left: MediaQuery.of(context).size.width * 0.4,
                                          top: 20,
                                          right: 20
                                      ),
                                      height: 130,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                              Color(0xFF60BE93),
                                              Color(0xFF1B8D59),
                                          ]),
                                          borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: RichText(
                                          text: TextSpan(
                                              children: [
                                                  TextSpan(
                                                      text: "Dial 999 for Medical Help!\n",
                                                      style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white)
                                                  ),
                                                  TextSpan(
                                                      text: "If any symptoms appear",
                                                      style: TextStyle(color: Colors.white),
                                                  )
                                              ]
                                          )
                                      ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: SvgPicture.asset("assets/icons/nurse.svg"),
                                  ),
                                  Positioned(
                                      top: 30,
                                      right: 10,
                                    child: SvgPicture.asset("assets/icons/virus.svg"),
                                  ),
                              ],
                          ),
                        ),
                        SizedBox(height: 5,),
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
