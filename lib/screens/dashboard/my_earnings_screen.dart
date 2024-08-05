import 'package:flutter/material.dart';
import 'package:udex_driver/utils/dimensions.dart';
import 'package:udex_driver/utils/custom_style.dart';
import 'package:udex_driver/utils/strings.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class MyEarningsScreen extends StatefulWidget {
  @override
  _MyEarningsScreenState createState() => _MyEarningsScreenState();
}


class _MyEarningsScreenState extends State<MyEarningsScreen> {

  PageController _pageController = PageController(viewportFraction: 1, keepPage: true);
  int pageNumber = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Image.asset(
                'assets/bg.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              DraggableScrollableSheet(
                builder: (context, scrollController){
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions
                            .radius * 3),
                            topRight: Radius.circular(Dimensions.radius * 3))
                    ),
                    child: SingleChildScrollView(
                      child: bodyWidget(context),
                      controller: scrollController,
                    ),
                  );
                },
                initialChildSize: 0.77,
                minChildSize: 0.77,
                maxChildSize: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Dimensions.heightSize * 3, right: Dimensions
              .marginSize, left: Dimensions.marginSize),
          child: Text(
            Strings.earning,
            style: GoogleFonts.roboto(
              color: CustomColor.primaryColor,
              fontSize: Dimensions.extraLargeTextSize,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: Dimensions.heightSize * 2, right: Dimensions
              .marginSize, left: Dimensions.marginSize),
          child: Container(
            width: 225.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Strings.today,
                      style: GoogleFonts.roboto(
                        fontSize: Dimensions.largeTextSize,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      Strings.weekly,
                      style: GoogleFonts.roboto(
                        fontSize: Dimensions.largeTextSize,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      Strings.monthly,
                      style: GoogleFonts.roboto(
                          fontSize: Dimensions.largeTextSize,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.heightSize,),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: Dimensions
              .marginSize, left: Dimensions.marginSize),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        _pageController.jumpToPage(index); // for regular jump
                        _pageController.animateToPage(2, curve: Curves.decelerate, duration:
                        Duration(milliseconds: 300)); //// for animated jump. Requires a curve and a duration
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 3,
                                width: 75.0,
                                color: index == 1 ? Colors.grey : CustomColor.accentColor,
                              ),
                              Container(
                                height: 3,
                                width: 75,
                                color: index == 0 ? Colors.grey : CustomColor.accentColor,
                              ),
                              Container(
                                height: 3,
                                width: 75,
                                color: index == 2 ? CustomColor.accentColor : Colors.grey,
                              ),
                            ],
                          ),
                          goToPageView(index)
                        ],
                      )
                      //child: goToPageView(index)
                  );
                }
            ),
          ),
        ),
      ],
    );
  }

  goToPageView(int index) {
    pageNumber = index;
    print(pageNumber.toString());
    switch(index) {
      case 0:
        return todayWidget(context);
      case 1:
        return weeklyWidget(context);
      case 2:
        return weeklyWidget(context);
    }
  }

  todayWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimensions.heightSize * 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '25',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.extraLargeTextSize,
                    color: CustomColor.primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  Strings.totalRide,
                  style: CustomStyle.textStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '4.75',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.extraLargeTextSize,
                    color: CustomColor.primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  Strings.onlineHrs,
                  style: CustomStyle.textStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '\$250',
                  style: GoogleFonts.roboto(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: CustomColor.primaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  Strings.totalEarning,
                  style: CustomStyle.textStyle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize * 3,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.rideYellow,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$40.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.greenTaxi,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$75.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.yahoma,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$150.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey,),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.sajuka,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$65.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey, thickness: 2,),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.total,
              style: GoogleFonts.roboto(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '\$330.00',
              style: GoogleFonts.roboto(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),

      ],
    );
  }

  weeklyWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimensions.heightSize * 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '500',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.extraLargeTextSize,
                    color: CustomColor.primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  Strings.totalRide,
                  style: CustomStyle.textStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '94.75',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.extraLargeTextSize,
                    color: CustomColor.primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  Strings.onlineHrs,
                  style: CustomStyle.textStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '\$3350',
                  style: GoogleFonts.roboto(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: CustomColor.primaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  Strings.totalEarning,
                  style: CustomStyle.textStyle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize * 3,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.rideYellow,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$140.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.greenTaxi,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$1175.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.yahoma,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$1250.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey,),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.sajuka,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$650.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey, thickness: 2,),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.total,
              style: GoogleFonts.roboto(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '\$3350.00',
              style: GoogleFonts.roboto(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),

      ],
    );
  }

  monthlyWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: Dimensions.heightSize * 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '500',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.extraLargeTextSize,
                    color: CustomColor.primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  Strings.totalRide,
                  style: CustomStyle.textStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '94.75',
                  style: GoogleFonts.roboto(
                    fontSize: Dimensions.extraLargeTextSize,
                    color: CustomColor.primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  Strings.onlineHrs,
                  style: CustomStyle.textStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '\$3350',
                  style: GoogleFonts.roboto(
                      fontSize: Dimensions.extraLargeTextSize,
                      color: CustomColor.primaryColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  Strings.totalEarning,
                  style: CustomStyle.textStyle,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize * 3,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.rideYellow,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$140.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.greenTaxi,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$1175.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.yahoma,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$1250.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey,),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.sajuka,
              style: CustomStyle.textStyle,
            ),
            Text(
              '\$650.00',
              style: CustomStyle.textStyle,
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Divider(color: Colors.grey, thickness: 2,),
        SizedBox(height: Dimensions.heightSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Strings.total,
              style: GoogleFonts.roboto(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              '\$3350.00',
              style: GoogleFonts.roboto(
                  fontSize: Dimensions.extraLargeTextSize,
                  color: CustomColor.primaryColor,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),

      ],
    );
  }
}
