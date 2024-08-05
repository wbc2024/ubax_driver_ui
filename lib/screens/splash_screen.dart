// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:udex_driver/utils/dimensions.dart';
import 'package:udex_driver/utils/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:udex_driver/screens/onboard/on_board_screen.dart';
import 'onboard/on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /**
     * after secons screen
     */
    // 
    Timer(
        Duration(
            seconds: 3
        ),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
            OnBoardScreen()
        ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Image.asset(
              'assets/splash.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
            ),
            Image.asset(
              'assets/icon_white.png',
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 2, right: Dimensions
                  .marginSize * 2),
              child: Text(
                Strings.perfectTaxiBooking,
                style: GoogleFonts.roboto(
                  fontSize: Dimensions.largeTextSize * 1.4,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: Dimensions.heightSize * 4,),
            Container(
              padding: const EdgeInsets.only(left: Dimensions.marginSize * 4, right: Dimensions
                  .marginSize * 4),
              width: MediaQuery.of(context).size.width,
              height: 8.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(CustomColor.accentColor,),
                //value: 0.8,
              ),
            )
          ],
        ),
      ),
    );
  }
}
