 // ignore_for_file: non_constant_identifier_names

 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udex_driver/utils/dimensions.dart';

drower_topview(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Dimensions.heightSize * 3,
      ),
      child: ListTile(
        leading: Image.asset(
          'assets/driver.png',
        ),
        title: Text(
          'Rockson Pular',
          style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: Dimensions.largeTextSize,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '+088 - 123456789',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: Dimensions.defaultTextSize,
          ),
        ),
      ),
    );
  }
