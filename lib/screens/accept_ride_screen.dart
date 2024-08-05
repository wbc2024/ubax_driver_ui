import 'package:flutter/material.dart';
import 'package:udex_driver/widgets/custom_google_map.dart';
import 'package:udex_driver/utils/dimensions.dart';
import 'package:udex_driver/utils/custom_style.dart';
import 'package:udex_driver/utils/strings.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udex_driver/screens/messaging_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:udex_driver/class/url_launcher.dart';
import 'package:udex_driver/screens/invoice_screen.dart';

class AcceptRideScreen extends StatefulWidget {
  @override
  _AcceptRideScreenState createState() => _AcceptRideScreenState();
}

class _AcceptRideScreenState extends State<AcceptRideScreen> {
  bool isAction = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: MediaQuery.of(context).size.height,
            //     child: CustomGoogleMap.map
            // ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: Dimensions.marginSize,
                            bottom: Dimensions.heightSize),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                              child: Icon(
                                Icons.gps_fixed,
                                color: CustomColor.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.heightSize,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius * 3),
                              topRight:
                                  Radius.circular(Dimensions.radius * 3))),
                      child: Stack(
                        //overflow: Overflow.visible,
                        children: [
                          Positioned(
                            top: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 300.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '7 km ',
                                        style: GoogleFonts.roboto(
                                            fontSize:
                                                Dimensions.extraLargeTextSize,
                                            color: CustomColor.primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.asset('assets/user.png'),
                                      Text(
                                        ' 30 min',
                                        style: GoogleFonts.roboto(
                                            fontSize:
                                                Dimensions.extraLargeTextSize,
                                            color: CustomColor.primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: Dimensions.heightSize),
                                    child: Text(
                                      Strings.arrivedUser,
                                      // style: CustomStyle.textStyle,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.call,
                                          color: CustomColor.accentColor,
                                        ),
                                        onPressed: () {
                                          // UrlLauncher.url(Strings.phoneNumber);
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.message,
                                          color: CustomColor.greyColor,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MessagingScreen()));
                                        },
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: new LinearPercentIndicator(
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      animation: true,
                                      lineHeight: 30.0,
                                      animationDuration: 2500,
                                      percent: 0.8,
                                      center: Text(
                                        "80% Complete",
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                      progressColor: CustomColor.accentColor,
                                      backgroundColor: CustomColor.primaryColor,
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 40.0,
                                      width: 200.0,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  Dimensions.radius * 0.5))),
                                      child: Center(
                                        child: Text(
                                          Strings.finishRide.toUpperCase(),
                                          style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontSize:
                                                  Dimensions.largeTextSize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InvoiceScreen()));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
