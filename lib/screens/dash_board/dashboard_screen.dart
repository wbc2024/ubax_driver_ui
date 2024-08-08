// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:udex_driver/screens/sign%20in/sign_in_screen.dart';
import 'package:udex_driver/utils/dimensions.dart';
import 'package:udex_driver/utils/custom_style.dart';
import 'package:udex_driver/utils/strings.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udex_driver/screens/cancel_ride_screen.dart';
import 'package:udex_driver/screens/accept_ride_screen.dart';
import 'package:udex_driver/screens/dashboard/my_earnings_screen.dart';
import 'package:udex_driver/screens/dashboard/my_wallet_screen.dart';
import 'package:udex_driver/screens/dashboard/notifications_screen.dart';
import 'package:udex_driver/screens/dashboard/change_password_screen.dart';
import 'package:udex_driver/screens/dashboard/profile_overview_screen.dart';

import 'component/drower.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isAction = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // getLocation();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      drawer: dashboard_drower(context),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            /**
             * add google map here
             */
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // child: CustomGoogleMap.map
              child: Container(
                  color: Colors.purple,
                  child: Center(child: Text('add google map'))),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
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
                            GestureDetector(
                              child: Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: CustomColor.primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                child: Center(
                                  child: Text(
                                    Strings.acceptRide,
                                    style: GoogleFonts.roboto(
                                        fontSize: Dimensions.largeTextSize,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onTap: () {
                                getRideRequestDialog();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius * 3),
                              topRight:
                                  Radius.circular(Dimensions.radius * 3))),
                      child: Stack(
                        //overflow: Overflow.visible,
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                            top: -35,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: isAction
                                                  ? Colors.green
                                                  : Colors.red,
                                              width: 4),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(35.0))),
                                      child: Center(
                                        child: Text(
                                          isAction
                                              ? Strings.go.toUpperCase()
                                              : Strings.stop.toUpperCase(),
                                          style: GoogleFonts.roboto(
                                              fontSize:
                                                  Dimensions.extraLargeTextSize,
                                              color: isAction
                                                  ? Colors.green
                                                  : Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isAction = !isAction;

                                        print(isAction.toString());
                                      });
                                    },
                                  ),
                                  Text(
                                    isAction
                                        ? '${Strings.your} ${Strings.offline}'
                                        : '${Strings.your} ${Strings.online}',
                                    style: GoogleFonts.roboto(
                                        fontSize: Dimensions.extraLargeTextSize,
                                        color: CustomColor.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: Dimensions.marginSize,
                                        right: Dimensions.marginSize),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset('assets/success.png'),
                                            SizedBox(
                                              height:
                                                  Dimensions.heightSize * 0.5,
                                            ),
                                            Text(
                                              '78.0%',
                                              style: GoogleFonts.roboto(
                                                  fontSize: Dimensions
                                                      .extraLargeTextSize,
                                                  color:
                                                      CustomColor.primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height:
                                                  Dimensions.heightSize * 0.5,
                                            ),
                                            Text(
                                              Strings.acceptance,
                                              style: CustomStyle.textStyle,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset('assets/star.png'),
                                            SizedBox(
                                              height:
                                                  Dimensions.heightSize * 0.5,
                                            ),
                                            Text(
                                              '4.75',
                                              style: GoogleFonts.roboto(
                                                  fontSize: Dimensions
                                                      .extraLargeTextSize,
                                                  color:
                                                      CustomColor.primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height:
                                                  Dimensions.heightSize * 0.5,
                                            ),
                                            Text(
                                              Strings.rating,
                                              style: CustomStyle.textStyle,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Image.asset('assets/decline.png'),
                                            SizedBox(
                                              height:
                                                  Dimensions.heightSize * 0.5,
                                            ),
                                            Text(
                                              '2.0%',
                                              style: GoogleFonts.roboto(
                                                  fontSize: Dimensions
                                                      .extraLargeTextSize,
                                                  color:
                                                      CustomColor.primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height:
                                                  Dimensions.heightSize * 0.5,
                                            ),
                                            Text(
                                              Strings.cancellation,
                                              style: CustomStyle.textStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
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
    return scaffold;
  }

  // void getLocation() async {
  //   LocationData myLocation;
  //   String error;
  //   Location location = new Location();
  //   try {
  //     myLocation = await location.getLocation();
  //   } on PlatformException catch (e) {
  //     if (e.code == 'PERMISSION_DENIED') {
  //       error = 'please grant permission';
  //       print(error);
  //     }
  //     if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
  //       error = 'permission denied- please enable it from app settings';
  //       print(error);
  //     }
  //     myLocation = null;
  //   }

  //   setState(() {
  //     Dimensions.latitude = myLocation.latitude;
  //     Dimensions.longitude = myLocation.longitude;
  //   });
  //   print('lat: '+myLocation.latitude.toString());
  //   print('lon: '+myLocation.longitude.toString());
  // }

  Future<bool> getRideRequestDialog() async {
    return (await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              color: CustomColor.primaryColor,
              child: AlertDialog(
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/user.png',
                            height: 80.0,
                            width: 80.0,
                            fit: BoxFit.fill,
                          )),
                      SizedBox(
                        height: Dimensions.heightSize * 2,
                      ),
                      Text(
                        '30 min',
                        style: GoogleFonts.roboto(
                            color: CustomColor.primaryColor,
                            fontSize: Dimensions.largeTextSize,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: Dimensions.heightSize),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '\$130',
                            style: CustomStyle.textStyle,
                          ),
                          Text(
                            '5.5 km',
                            style: CustomStyle.textStyle,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: CustomColor.primaryColor,
                              ),
                              Text(
                                '4.9',
                                style: CustomStyle.textStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.heightSize),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.directions,
                            color: CustomColor.primaryColor,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: Text(
                              'Park road London 5487',
                              style: CustomStyle.textStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Dimensions.heightSize),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.directions,
                            color: CustomColor.primaryColor,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: Text(
                              'Washion town emplace road',
                              style: CustomStyle.textStyle,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: Container(
                                height: 35.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                    color: CustomColor.primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                child: Center(
                                  child: Text(
                                    Strings.cancel.toUpperCase(),
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: Dimensions.defaultTextSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CancelRideScreen()));
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              child: Container(
                                height: 35.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                    color: CustomColor.accentColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0))),
                                child: Center(
                                  child: Text(
                                    Strings.acceptRide.toUpperCase(),
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: Dimensions.defaultTextSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AcceptRideScreen()));
                              },
                            ),
                          ],
                        ),
                      ),
/*
                      Stack(
                        //overflow: Overflow.visible,
                        //clipBehavior: Clip.hardEdge,
                        children: [
                          Positioned(
                            //top: -60,
                            left: 0,
                            right: 0,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/user.png',
                                  height: 80.0,
                                  width: 80.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 45,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: Dimensions.heightSize * 2,
                                  ),
                                  Text(
                                    '30 min',
                                    style: GoogleFonts.roboto(
                                        color: CustomColor.primaryColor,
                                        fontSize: Dimensions.largeTextSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: Dimensions.heightSize),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '\$130',
                                        style: CustomStyle.textStyle,
                                      ),
                                      Text(
                                        '5.5 km',
                                        style: CustomStyle.textStyle,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: CustomColor.primaryColor,
                                          ),
                                          Text(
                                            '4.9',
                                            style: CustomStyle.textStyle,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.heightSize),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.directions,
                                        color: CustomColor.primaryColor,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Park road London 5487',
                                          style: CustomStyle.textStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.heightSize),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.directions,
                                        color: CustomColor.primaryColor,
                                      ),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Washion town emplace road',
                                          style: CustomStyle.textStyle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        height: 35.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                            color: CustomColor.primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        child: Center(
                                          child: Text(
                                            Strings.cancel.toUpperCase(),
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize:
                                                    Dimensions.defaultTextSize,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CancelRideScreen()));
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        height: 35.0,
                                        width: 100.0,
                                        decoration: BoxDecoration(
                                            color: CustomColor.accentColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0))),
                                        child: Center(
                                          child: Text(
                                            Strings.acceptRide.toUpperCase(),
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize:
                                                    Dimensions.defaultTextSize,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AcceptRideScreen()));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    */
                    ],
                  ),
                ),
              ),
            ),
          ),
        )) ??
        false;
  }
}
