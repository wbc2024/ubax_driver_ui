import 'package:flutter/material.dart';
import 'package:udex_driver/utils/dimensions.dart';
import 'package:udex_driver/utils/custom_style.dart';
import 'package:udex_driver/utils/strings.dart';
import 'package:udex_driver/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _toggleVisibility = true;

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
    return Padding(
      padding: const EdgeInsets.only(left: Dimensions.marginSize, right: Dimensions.marginSize,
          top: Dimensions.heightSize * 3),
      child: Column(
        children: [
          Text(
            Strings.changePassword,
            style: GoogleFonts.roboto(
                fontSize: Dimensions.extraLargeTextSize * 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.primaryColor
            ),
          ),
          SizedBox(height: Dimensions.heightSize * 3,),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.oldPassword,
                    style: CustomStyle.textStyle,
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: oldPasswordController,
                    validator: ( value){
                      if(value!.isEmpty){
                        return Strings.pleaseFillOutTheField;
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: Strings.typePassword,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: CustomStyle.textStyle,
                      prefixIcon: Icon(
                          Icons.lock
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _toggleVisibility = !_toggleVisibility;
                          });
                        },
                        icon: _toggleVisibility
                            ? Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                            : Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    obscureText: _toggleVisibility,
                  ),
                  SizedBox(height: Dimensions.heightSize),
                  Text(
                    Strings.newPassword,
                    style: CustomStyle.textStyle,
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: newPasswordController,
                    validator: ( value){
                      if(value!.isEmpty){
                        return Strings.pleaseFillOutTheField;
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: Strings.typePassword,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: CustomStyle.textStyle,
                      prefixIcon: Icon(
                          Icons.lock
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _toggleVisibility = !_toggleVisibility;
                          });
                        },
                        icon: _toggleVisibility
                            ? Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                            : Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    obscureText: _toggleVisibility,
                  ),
                  SizedBox(height: Dimensions.heightSize),
                  Text(
                    Strings.confirmPassword,
                    style: CustomStyle.textStyle,
                  ),
                  SizedBox(height: Dimensions.heightSize * 0.5),
                  TextFormField(
                    style: CustomStyle.textStyle,
                    controller: confirmPasswordController,
                    validator: ( value){
                      if(value!.isEmpty){
                        return Strings.pleaseFillOutTheField;
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: Strings.typePassword,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      labelStyle: CustomStyle.textStyle,
                      focusedBorder: CustomStyle.focusBorder,
                      enabledBorder: CustomStyle.focusErrorBorder,
                      focusedErrorBorder: CustomStyle.focusErrorBorder,
                      errorBorder: CustomStyle.focusErrorBorder,
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.lock
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _toggleVisibility = !_toggleVisibility;
                          });
                        },
                        icon: _toggleVisibility
                            ? Icon(
                          Icons.visibility_off,
                          color: Colors.black,
                        )
                            : Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                      ),
                      hintStyle: CustomStyle.textStyle,
                    ),
                    obscureText: _toggleVisibility,
                  ),
                  SizedBox(height: Dimensions.heightSize),
                ],
              )
          ),
          SizedBox(height: Dimensions.heightSize),
          GestureDetector(
            child: Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: CustomColor.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius * 0.5))
              ),
              child: Center(
                child: Text(
                  Strings.changePassword.toUpperCase(),
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: Dimensions.largeTextSize,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}
