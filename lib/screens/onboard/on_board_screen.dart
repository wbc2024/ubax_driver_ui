// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:udex_driver/utils/dimensions.dart';
import 'package:udex_driver/utils/strings.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udex_driver/screens/sign%20in/sign_in_screen.dart';

import 'data.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int totalPages = OnBoardingItems.loadOnboardItem().length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryColor,
      body: PageView.builder(
          itemCount: totalPages,
          itemBuilder: (context, index) {
            OnBoardingItem oi = OnBoardingItems.loadOnboardItem()[index];
            return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Image.asset(
                            oi.image,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            oi.title,
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: Dimensions.extraLargeTextSize * 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            oi.subTitle,
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: Dimensions.extraLargeTextSize),
                          ),
                        ),
                        SizedBox(
                          height: 60.0,
                        ),
                        index != (totalPages - 1)
                            ? Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 15.0,
                                  child: ListView.builder(
                                    itemCount: totalPages,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, i) {
                                      return Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Container(
                                          width: index == i ? 25 : 20.0,
                                          decoration: BoxDecoration(
                                              color: index == i
                                                  ? CustomColor.accentColor
                                                  : Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : GestureDetector(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: CustomColor.accentColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                Dimensions.radius * 0.5))),
                                    child: Center(
                                      child: Text(
                                        Strings.getStarted.toUpperCase(),
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: Dimensions.largeTextSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // print('Sign in scren');
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  SignInScreen()));
                                },
                              )
                      ],
                    ),
                  ],
                ));
          }),
    );
  }
}
