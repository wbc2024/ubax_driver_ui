// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:udex_driver/utils/dimensions.dart';
import 'package:udex_driver/utils/custom_style.dart';
import 'package:udex_driver/utils/strings.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udex_driver/screens/auth/sign_up_screen.dart';

import '../dash_board/dashboard_screen.dart';
// import 'package:udex_driver/screens/dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String selectedCounty = 'United States';
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _toggleVisibility = true;
  bool checkRememberMe = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mobileController.text = '+1';
  }

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
                      child: signInWidget(context),
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

  signInWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: Dimensions.marginSize,
          right: Dimensions.marginSize,
          top: Dimensions.heightSize * 3),
      child: (Column(
        children: [
          Text(
            Strings.signInAccount,
            style: GoogleFonts.roboto(
                fontSize: Dimensions.extraLargeTextSize,
                fontWeight: FontWeight.bold,
                color: CustomColor.primaryColor),
          ),
          SizedBox(
            height: Dimensions.heightSize * 3,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.phone,
                    style: GoogleFonts.roboto(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor),
                  ),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.1)),
                        borderRadius: BorderRadius.all(
                            Radius.circular(Dimensions.radius * 0.5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // country selected
                        Expanded(
                          child: Container(
                            height: 55.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.1)),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Dimensions.radius * 0.5))),
                            child: CountryCodePicker(
                              onChanged: (value) {
                                setState(() {
                                  selectedCounty = value.name.toString();
                                });
                              },
                              initialSelection: '+880',
                              showFlagDialog: true,
                              favorite: ['+39', 'FR'],
                              showCountryOnly: true,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                              textStyle: CustomStyle.textStyle,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: TextFormField(
                            style: CustomStyle.textStyle,
                            controller: mobileController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return Strings.pleaseFillOutTheField;
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: Strings.phone,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              labelStyle: CustomStyle.textStyle,
                              filled: true,
                              fillColor: Colors.white,
                              hintStyle: CustomStyle.textStyle,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.heightSize * 2,
                  ),
                  Text(
                    Strings.password,
                    style: GoogleFonts.roboto(
                        fontSize: Dimensions.defaultTextSize,
                        color: CustomColor.primaryColor),
                  ),
                  SizedBox(
                    height: Dimensions.heightSize,
                  ),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Strings.pleaseFillOutTheField;
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: Strings.password,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: CustomStyle.textStyle,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _toggleVisibility = !_toggleVisibility;
                          });
                        },
                        icon: _toggleVisibility
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.black.withOpacity(0.2),
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.black.withOpacity(0.2),
                              ),
                      ),
                    ),
                    obscureText: _toggleVisibility,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.heightSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: Theme(
                    data: ThemeData(
                        unselectedWidgetColor: Colors.black.withOpacity(0.1),
                        primarySwatch: Colors.green),
                    child: CheckboxListTile(
                      title: Text(
                        Strings.rememberMe,
                        style: CustomStyle.textStyle,
                      ),
                      value: checkRememberMe,
                      onChanged: (newValue) {
                        setState(() {
                          checkRememberMe = newValue!;
                        });
                      },
                      controlAffinity:
                          ListTileControlAffinity.leading, //  <-- leading
                      // Checkbox
                    )),
              ),
              GestureDetector(
                child: Text(
                  Strings.forgotPassword,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: CustomColor.blueColor,
                      decoration: TextDecoration.underline),
                ),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(
            height: Dimensions.heightSize * 3,
          ),
          /**
           * Sign in button
           */
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
                  Strings.signIn.toUpperCase(),
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            onTap: () {
              print('Dashboard screen');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
          ),
          SizedBox(height: Dimensions.heightSize * 2),
          /**
           * create account button
           */
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                Strings.dontHaveAccount,
                style: CustomStyle.textStyle,
              ),
              GestureDetector(
                child: Text(
                  Strings.signUp,
                  style: TextStyle(
                      fontSize: Dimensions.defaultTextSize,
                      color: CustomColor.blueColor,
                      decoration: TextDecoration.underline),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              ),
            ],
          )
        ],
      )),
    );
  }
}
