// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:udex_driver/utils/dimensions.dart';
import 'package:udex_driver/utils/custom_style.dart';
import 'package:udex_driver/utils/strings.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udex_driver/screens/dash_board/dashboard_screen.dart';
import 'package:udex_driver/widgets/my_rating.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController commentController = TextEditingController();

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
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimensions.radius * 3),
                            topRight: Radius.circular(Dimensions.radius * 3))),
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
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: Dimensions.heightSize * 3,
              left: Dimensions.marginSize,
              right: Dimensions.marginSize),
          child: Text(
            Strings.howYourPassenger,
            style: GoogleFonts.roboto(
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold,
                color: CustomColor.primaryColor),
          ),
        ),
        SizedBox(height: Dimensions.heightSize),
        Image.asset(
          'assets/user.png',
          height: 80.0,
        ),
        Text(
          'Jonson William',
          style: GoogleFonts.roboto(
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.bold,
              color: CustomColor.primaryColor),
        ),
        SizedBox(height: Dimensions.heightSize * 3),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.giveRating,
                style: GoogleFonts.roboto(
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.primaryColor),
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.behaviour,
                          style: GoogleFonts.roboto(
                              fontSize: Dimensions.largeTextSize,
                              color: CustomColor.primaryColor),
                        ),
                        SizedBox(
                          height: Dimensions.heightSize * 0.5,
                        ),
                        // MyRating(
                        //   rating: '5',
                        // )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.payment,
                          style: GoogleFonts.roboto(
                              fontSize: Dimensions.largeTextSize,
                              color: CustomColor.primaryColor),
                        ),
                        SizedBox(
                          height: Dimensions.heightSize * 0.5,
                        ),
                        // MyRating(
                        //   rating: '5',
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.heightSize * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.meetAgain,
                          style: GoogleFonts.roboto(
                              fontSize: Dimensions.largeTextSize,
                              color: CustomColor.primaryColor),
                        ),
                        SizedBox(
                          height: Dimensions.heightSize * 0.5,
                        ),
                        // MyRating(
                        //   rating: '5',
                        // )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.communication,
                          style: GoogleFonts.roboto(
                              fontSize: Dimensions.largeTextSize,
                              color: CustomColor.primaryColor),
                        ),
                        SizedBox(
                          height: Dimensions.heightSize * 0.5,
                        ),
                        // MyRating(
                        //   rating: '5',
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.heightSize * 3,
              ),
              Text(
                Strings.yourComment,
                style: GoogleFonts.roboto(
                    fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.primaryColor),
              ),
              SizedBox(
                height: Dimensions.heightSize * 0.5,
              ),
              TextFormField(
                style: CustomStyle.textStyle,
                controller: commentController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Strings.pleaseFillOutTheField;
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: Strings.riderFeedback,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
                  labelStyle: CustomStyle.textStyle,
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: CustomStyle.hintTextStyle,
                  focusedBorder: CustomStyle.focusBorder,
                  enabledBorder: CustomStyle.focusErrorBorder,
                  focusedErrorBorder: CustomStyle.focusErrorBorder,
                  errorBorder: CustomStyle.focusErrorBorder,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.heightSize * 3,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.marginSize, right: Dimensions.marginSize),
          child: Column(
            children: [
              GestureDetector(
                child: Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomColor.accentColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius * 0.5))),
                  child: Center(
                    child: Text(
                      Strings.done.toUpperCase(),
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: Dimensions.largeTextSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  print('Opne dashboard_screen');
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DashboardScreen()));
                },
              ),
              SizedBox(
                height: Dimensions.heightSize,
              ),
              GestureDetector(
                child: Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomColor.primaryColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(Dimensions.radius * 0.5))),
                  child: Center(
                    child: Text(
                      Strings.notNow.toUpperCase(),
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: Dimensions.largeTextSize,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  print('open dashboard');
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DashboardScreen()));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
