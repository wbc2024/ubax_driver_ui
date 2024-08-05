import 'package:flutter/material.dart';

import 'package:udex_driver/utils/dimensions.dart';
import 'package:udex_driver/utils/custom_style.dart';
import 'package:udex_driver/utils/strings.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udex_driver/screens/dash_board/dashboard_screen.dart';

class CancelRideScreen extends StatefulWidget {
  @override
  _CancelRideScreenState createState() => _CancelRideScreenState();
}

enum SingingCharacter { reason1, reason2, reason3, reason4 }

class _CancelRideScreenState extends State<CancelRideScreen> {
  SingingCharacter _character = SingingCharacter.reason1;

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
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          top: Dimensions.heightSize * 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.cancelRide,
            style: GoogleFonts.roboto(
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold,
                color: CustomColor.primaryColor),
          ),
          SizedBox(
            height: Dimensions.heightSize * 3,
          ),
          ListTile(
            title: Text(
              Strings.reason1,
              // style: CustomStyle.textStyle,
            ),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.reason1,
              toggleable: true,
              autofocus: true,
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value!;
                });
              },
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              Strings.reason2,
              // style: CustomStyle.textStyle,
            ),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.reason2,
              toggleable: true,
              autofocus: true,
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value!;
                });
              },
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              Strings.reason3,
              // style: CustomStyle.textStyle,
            ),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.reason3,
              toggleable: true,
              autofocus: true,
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value!;
                });
              },
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          ListTile(
            title: Text(
              Strings.reason4,
              // style: CustomStyle.textStyle,
            ),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.reason4,
              toggleable: true,
              autofocus: true,
              groupValue: _character,
              onChanged: (value) {
                setState(() {
                  _character = value!;
                });
              },
            ),
          ),
          Divider(
            color: Colors.black.withOpacity(0.3),
          ),
          SizedBox(
            height: Dimensions.heightSize * 3,
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
                  Strings.done.toUpperCase(),
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              cancelRideDialog();
            },
          ),
        ],
      ),
    );
  }

  Future<bool> cancelRideDialog() async {
    return (await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              color: CustomColor.primaryColor,
              child: Stack(
                children: [
                  AlertDialog(
                      content: Stack(
                    //overflow: Overflow.visible,
                    children: [
                      Positioned(
                        top: -60,
                        left: 0,
                        right: 0,
                        child: Container(
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
                        child: Container(
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '\$130',
                                    // style: CustomStyle.textStyle,
                                  ),
                                  Text(
                                    '5.5 km',
                                    // style: CustomStyle.textStyle,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: CustomColor.primaryColor,
                                      ),
                                      Text(
                                        '4.9',
                                        // style: CustomStyle.textStyle,
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
                                      // style: CustomStyle.textStyle,
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
                                      // style: CustomStyle.textStyle,
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
                        child: Container(
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
                                        Strings.yesCancel.toUpperCase(),
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize:
                                                Dimensions.defaultTextSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    print('opne Dash board screen');
                                    // Navigator.of(context).pushReplacement(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             DashboardScreen()));
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
                                        Strings.no.toUpperCase(),
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize:
                                                Dimensions.defaultTextSize,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
        )) ??
        false;
  }
}
